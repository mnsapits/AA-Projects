# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({username: 'user_john'})
User.create({username: 'user_alex'})
User.create({username: 'user_adam'})

Contact.create({name: 'John', email: 'john@email.com', user_id: 1})
Contact.create({name: 'Alex', email: 'alex@email.com', user_id: 2})
Contact.create({name: 'Adam', email: 'adam@email.com', user_id: 3})

ContactShare.create({user_id: 1, contact_id: 2})
ContactShare.create({user_id: 1, contact_id: 3})
ContactShare.create({user_id: 2, contact_id: 1})
