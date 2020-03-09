event1 = Event.create!(route_id: 1, description: 'The challenge? To run around 5km on our epic closed road route past some of London’s most famous and historic landmarks.', title: '5km run', starttime:DateTime.now )

event2 = Event.create!(route_id: 2, description: 'Come and run a chip timed 3k and see how your winter training is progressing so far!', title: '3km run', starttime: Time.zone.parse('2020-03-11 10:00'))
