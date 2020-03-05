user1=User.create!(name:'max', lastname:"denton", email:"max@mail.com", username:"bakemypotatoes", password:"123456")

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

Route.create!(user: user1)
Node.create!(name: "Max's house", route: Route.second, real:true, address: "SW15 2SP")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

Route.create!(user: user1)
Node.create!(name: "Max's house", route: Route.second, real:true, address: "KT12 3PU")
Node.create!(name: "T1.1", route: Route.first, real: false)
Node.create!(name: "T1.2", route: Route.first, real: false)
Node.create!(name: "T1.3", route: Route.first, real: false)

