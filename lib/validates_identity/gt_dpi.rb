# frozen_string_literal: true

require 'validates_identity'
require_relative 'gt_dpi/version'

class ValidatesIdentity
  module GtDpi
    autoload :Validator, 'validates_identity/gt_dpi/validator'
  end
end

ValidatesIdentity.register_identity_type('GT_DPI', ValidatesIdentity::GtDpi::Validator)
ValidatesIdentity::ShouldaMatchers.register_allowed_values('GT_DPI', %w[1234567891507 2345678990102])
ValidatesIdentity::ShouldaMatchers.register_disallowed_values('GT_DPI', %w[1234567881507 1234567892307 1234567891618])
