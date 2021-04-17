# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

2.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

5.times do 
    Resource.create(name: Faker::Space.constellation, amount: "$" + Faker::Number.within(range: 0..50000).to_s, link: Faker::Internet.domain_name, description: Faker::Lorem.paragraph, organization_id: Faker::Number.between(from: 1, to: 3))
end

# 3.times do 
#     Organization.create(name: Faker::Company.name)
# end

# 10.times do 
#     Category.create(name: Faker::Lorem.word)
# end
