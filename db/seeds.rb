# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
profile_pic1 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')

event_photo_1 = URI.open('https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
event_photo_2 = URI.open('https://images.unsplash.com/photo-1513593771513-7b58b6c4af38?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')

user1 = User.create!(username: "test1", name: "Dan", email: "daniel@test.com", password:"123456", password_confirmation:"123456")
user1.photo.attach(io: profile_pic1, filename: 'pp1.png', content_type: 'image/png')

event1 = Event.create!(description: 'The challenge? To run around 5km on our epic closed road route past some of London’s most famous and historic landmarks.', title: '5km run', starttime: Date.new)
event1.photo.attach(io: event_photo_1, filename: 'event_photo_1.png', content_type: 'image/jpg')

event2 = Event.create!(description: 'Come and run a chip timed 3k and see how your winter training is progressing so far!', title: '3km run', starttime: Date.new)
event2.photo.attach(io: event_photo_2, filename: 'event_photo_2.png', content_type: 'image/jpg')
