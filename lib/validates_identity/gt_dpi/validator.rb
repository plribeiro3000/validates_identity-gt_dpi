# frozen_string_literal: true

class ValidatesIdentity
  module GtDpi
    class Validator
      VALIDATION_REGULAR_EXPRESSION = /\A([0-9]{8})([0-9])([0-9]{2})([0-9]{2})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?
        return false if number.nil?
        return false if birth_state_invalid?
        return false if birth_city_invalid?

        calculated_checksum == checksum
      end

      def formatted
        value
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def number
        return if result.nil?

        @number ||= result[1]
      end

      def checksum
        return if result.nil?

        @checksum ||= result[2].to_i
      end

      def birth_state_code
        return if result.nil?

        @birth_state_code ||= result[3].to_i
      end

      def birth_state_invalid?
        birth_state_code.zero? || birth_state_code > biggest_state_code
      end

      def birth_city_code
        return if result.nil?

        @birth_city_code ||= result[4].to_i
      end

      def birth_city_invalid?
        birth_city_code.zero? || birth_city_code > biggest_city_code_for(birth_state_code)
      end

      def calculated_checksum
        multiplied_numbers =
          (0..7).map do |index|
            (number[index].to_i * (index + 2))
          end

        multiplied_numbers.sum % 11
      end

      def biggest_city_code_for(state_code)
        city_county_by_state[state_code]
      end

      def biggest_state_code
        city_county_by_state.keys.max
      end

      # rubocop:disable Metrics/MethodLength
      def city_county_by_state
        {
          1 => 17, # Guatemala
          2 => 8, # El Progreso
          3 => 16, # Sacatepéquez
          4 => 16, # Chimaltenango
          5 => 13, # Escuintla
          6 => 14, # Santa Rosa
          7 => 19, # Sololá
          8 => 8, # Totonicapán
          9 => 24, # Quetzaltenango
          10 => 20, # Suchitepéquez
          11 => 9, # Retalhuleu
          12 => 29, # San Marcos
          13 => 32, # Huehuetenango
          14 => 22, # Quiché
          15 => 8, # Baja Verapaz
          16 => 17, # Alta Verapaz
          17 => 12, # Petén
          18 => 5, # Izabal
          19 => 10, # Zacapa
          20 => 11, # Chiquimula
          21 => 7, # Jalapa
          22 => 17 # Jutiapa
        }
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
