# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    name { "MyString" }
  end

  factory :internal_phone do

  end

  factory :user do
    index { rand(999) }
    fname { "Георгий#{rand}" }
    lname { "Петрович#{rand}" }
  end
end
