# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   User.create!(username:'steven', password: 'pw123456', password_confirmation:'pw123456', email:'steven@example.com')

5.times do
  User.create!(username:Faker::Internet.user_name, email:Faker::Internet.safe_email, password: 'pw123456', password_confirmation:'pw123456')
end

users = User.all

Group.create!(name: 'RSpec', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Active Record', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'MVC', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Enumerables', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Algorithms', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Classes', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Modules', language: 'Ruby', description: Faker::Lorem.paragraph, creator: users.sample)

Group.create!(name: 'jQuery', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'OO', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'AJAX', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'JSON', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'Jasmine', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)
Group.create!(name: 'For Loops', language: 'Javascript', description: Faker::Lorem.paragraph, creator: users.sample)

groups = Group.all

50.times do
  Snippet.create!(name: Faker::Hipster.words(2).join(" ").capitalize, content: Faker::Lorem.paragraph, group: groups.sample)
end


