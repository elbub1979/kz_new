# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'for fname' do
      it { should validate_presence_of :fname }
    end

    context 'for lname' do
      it { should validate_presence_of :lname }
    end
  end

  describe 'associations' do
    it { should have_many(:internal_phones) }
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
