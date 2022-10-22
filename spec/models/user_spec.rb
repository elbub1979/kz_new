# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'check validation' do
    it { should validate_presence_of :fname }
    it { should validate_presence_of :lname }
  end

  describe '#full_name' do
    let(:user) { User.create!(fname: 'Георгий', lname: 'Васин') }

    context 'without patronymic name' do
      it 'should be valid' do
        expect(user.full_name).to eq('Георгий Васин')
      end

      it 'should be not valid' do
        expect(user.full_name).to_not eq('Гарик Мартиросян')
      end
    end

    context 'with patronymic name' do
      before { user.update_attribute(:pname, 'Петрович') }

      it 'should be valid' do
        expect(user.full_name).to eq('Георгий Петрович Васин')
      end

      it 'should be not valid' do
        expect(user.full_name).to_not eq('Гарик Петрович Мартиросян')
      end
    end
  end
end
