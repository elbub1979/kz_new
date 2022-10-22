# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

InternalPhone.destroy_all
User.destroy_all

user1 = User.create!(fname: 'Илья', lname: 'Леушкин', pname: 'Александрович')
user1.internal_phones.create!(number: '111')

user2 = User.create!(fname: 'Михаил', lname: 'Полищук', pname: 'Иванович')
user2.internal_phones.create!(number: '222')

user3 = User.create!(fname: 'Рулон', lname: 'Обоев')
user3.internal_phones.create!(number: '333')
