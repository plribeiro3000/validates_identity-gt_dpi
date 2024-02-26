# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::GtDpi::Validator do
  it 'accepts 1234567891507' do
    expect(described_class.new('1234567891507')).to be_valid
  end

  it 'accepts 2345678990102' do
    expect(described_class.new('2345678990102')).to be_valid
  end

  it 'accepts 3456789071213' do
    expect(described_class.new('3456789071213')).to be_valid
  end

  it 'rejects 1234567881507' do
    expect(described_class.new('1234567881507')).not_to be_valid
  end

  it 'rejects 1234567892307' do
    expect(described_class.new('1234567892307')).not_to be_valid
  end

  it 'rejects 1234567891618' do
    expect(described_class.new('1234567891618')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
