user1 = User.create!(name:'max', lastname:"denton", email:"max@mail.com", username:"bakemypotatoes", password:"123456")
user2 = User.create!(username: "test1", name: "Dan", lastname:"ghimpu", email:"daniel@test.com", password:"123456", password_confirmation:"123456")

r1 = Route.create!(user: user1)
Node.create!(name: "Max's house", route: r1, real:true, address: "SW18 1PS")
Node.create!(name: "T1.1", route: r1, real: false)
Node.create!(name: "T1.2", route: r1, real: false)
Node.create!(name: "T1.3", route: r1, real: false)


r2 = Route.create!(user: user1)
Node.create!(name: "stinky's house", route: r2, real:true, address: "SW13 0LW")
Node.create!(name: "T1.1", route: r2, real: false)
Node.create!(name: "T1.2", route: r2, real: false)
Node.create!(name: "T1.3", route: r2, real: false)

r3 = Route.create!(user: user1)
Node.create!(name: "willies house", route: r3, real:true, address: "NW2 2AR")
Node.create!(name: "T1.1", route: r3, real: false)
Node.create!(name: "T1.2", route: r3, real: false)
Node.create!(name: "T1.3", route: r3, real: false)

r4 = Route.create!(user: user2)
Node.create!(name: "Max's house", route: r4, real:true, address: "SW15 2SP")
Node.create!(name: "T1.1", route: r4, real: false)
Node.create!(name: "T1.2", route: r4, real: false)
Node.create!(name: "T1.3", route: r4, real: false)

r5 = Route.create!(user: user2)
Node.create!(name: "Max's house", route: r5, real:true, address: "KT12 3PU")
Node.create!(name: "T1.1", route: r5, real: false)
Node.create!(name: "T1.2", route: r5, real: false)
Node.create!(name: "T1.3", route: r5, real: false)

profile_pic1 = URI.open('https://cdn.guidingtech.com/media/assets/WordPress-Import/2012/10/Smiley-Thumbnail.png')
profile_pic2 = URI.open('https://cdn2.f-cdn.com/contestentries/1376995/30494909/5b5e3e75ab981_thumb900.jpg')

event_photo_1 = URI.open('https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
event_photo_2 = URI.open('https://images.unsplash.com/photo-1513593771513-7b58b6c4af38?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')

user1.photo.attach(io: profile_pic1, filename: 'pp1.png', content_type: 'image/png')
user2.photo.attach(io: profile_pic2, filename: 'pp2.png', content_type: 'image/png')

event1 = Event.create!(route: r1, description: 'The challenge? To run around 5km on our epic closed road route past some of London’s most famous and historic landmarks.', title: '5km run', starttime: Date.new)
event1.photo.attach(io: event_photo_1, filename: 'event_photo_1.png', content_type: 'image/jpg')

event2 = Event.create!(route: r5, description: 'Come and run a chip timed 3k and see how your winter training is progressing so far!', title: '3km run', starttime: Date.new)
event2.photo.attach(io: event_photo_2, filename: 'event_photo_2.png', content_type: 'image/jpg')
