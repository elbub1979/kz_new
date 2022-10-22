require 'rails_helper'

RSpec.describe InternalPhone, type: :model do
  describe 'validations' do
    context 'for email' do
      context 'when format is invalid' do
        invalid_numbers.each do |invalid_number|
          it { should_not allow_value(invalid_number).for(:number) }
        end
      end

      context 'when format is valid' do
        valid_numbers.each do |valid_number|
          it { should allow_value(valid_number).for(:number) }
        end
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
