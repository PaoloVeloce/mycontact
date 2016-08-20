# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.destroy_all
Contact.destroy_all

# generate groups dummy data
groups = [];
# create new group and get the id and store to groups array
groups << Group.create(name: "Relatives").id # 0
groups << Group.create(name: "School-and-Academymates").id # 1
groups << Group.create(name: "Giovenzana").id # 2
groups << Group.create(name: "Coworkers").id # 3
groups << Group.create(name: "theKarma").id # 4
groups << Group.create(name: "Programmers").id # 5

contacts = [];

# generate 20 fake data
20.times do |i|
      new_contact = {
        id: i,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        company: Faker::Company.name,
        contactphone: Faker::PhoneNumber.cell_phone,
        workphone: Faker::PhoneNumber.phone_number,
        address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
        telegram: Faker::Boolean.boolean,
        whatsapp: Faker::Boolean.boolean,
        viber: Faker::Boolean.boolean,
        history: Faker::Hipster.paragraph,
        group_id: groups[Random.rand(0..5)]
      }
      contacts.push(new_contact)
end

# Save the fake data to database
Contact.create(contacts)

p "#{Group.count} groups successfully created"
p "#{Contact.count} contacts successfully created"
