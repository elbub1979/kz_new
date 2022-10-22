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

  describe '#capitalize_name' do
    let(:user) { User.create!(fname: 'георгий', lname: 'васин') }

    context 'without patronymic name' do
      context 'fname lname' do
        it 'should be valid' do
          expect(user.fname).to eq('Георгий')
          expect(user.lname).to eq('Васин')
        end

        it 'should be not valid' do
          expect(user.fname).to_not eq('георгий')
          expect(user.lname).to_not eq('васин')
        end
      end
    end

    context 'with patronymic name' do
      before { user.update_attribute(:pname, 'петрович') }

      it 'should be valid' do
        expect(user.pname).to eq('Петрович')
      end

      it 'should be not valid' do
        expect(user.pname).to_not eq('петрович')
      end
    end
  end
end
