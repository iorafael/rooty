user1 = User.create!(name:'max', lastname:"denton", email:"max@mail.com", username:"bakemypotatoes", password:"123456")
user2 = User.create!(username: "test1", name: "Dan", email: "daniel@test.com", password:"123456", password_confirmation:"123456")

Route.create!(user: user1)
Node.create!(name: "Max's house", route: Route.second, real:true, address: "SW18 1PS")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)


Route.create!(user: user1)
Node.create!(name: "stinky's house", route: Route.second, real:true, address: "SW13 0LW")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

Route.create!(user: user1)
Node.create!(name: "willies house", route: Route.second, real:true, address: "NW2 2AR")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

Route.create!(user: user2)
Node.create!(name: "Max's house", route: Route.second, real:true, address: "SW15 2SP")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

Route.create!(user: user2)
Node.create!(name: "Max's house", route: Route.second, real:true, address: "KT12 3PU")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

profile_pic1 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')

event_photo_1 = URI.open('https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
event_photo_2 = URI.open('https://images.unsplash.com/photo-1513593771513-7b58b6c4af38?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')

user2.photo.attach(io: profile_pic1, filename: 'pp1.png', content_type: 'image/png')

event1 = Event.create!(description: 'The challenge? To run around 5km on our epic closed road route past some of London’s most famous and historic landmarks.', title: '5km run', starttime: Date.new)
event1.photo.attach(io: event_photo_1, filename: 'event_photo_1.png', content_type: 'image/jpg')

event2 = Event.create!(description: 'Come and run a chip timed 3k and see how your winter training is progressing so far!', title: '3km run', starttime: Date.new)
event2.photo.attach(io: event_photo_2, filename: 'event_photo_2.png', content_type: 'image/jpg')