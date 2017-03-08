# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.create!(user:User.first,place:'Kater',description:'Sick party for everyone',title:'Cool party',date:'02-03-2017')
Event.create!(user:User.last,place:'Sisy',description:'Sick party for everyone',title:'Cool party v2',date:'02-03-2017')
Event.create!(user:User.last,place:'Rummels Bucht',description:'Sick party for everyone',title:'Cool party v3',date:'02-03-2017')

