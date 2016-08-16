# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Contact.destroy_all

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
        history: Faker::Hipster.paragraph
      }
      contacts.push(new_contact)
end

# Save the fake data to database
Contact.create(contacts)
