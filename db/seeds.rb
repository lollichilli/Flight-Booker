Airport.delete_all
Airport.create(code: 'SFO', name: 'San Francisco International Airport', location: 'San Francisco, CA')
Airport.create(code: 'JFK', name: 'John F. Kennedy International Airport', location: 'New York, NY')
Airport.create(code: 'LAX', name: 'Los Angeles International Airport', location: 'Los Angeles, CA')
Airport.create(code: 'ORD', name: "O'Hare International Airport", location: 'Chicago, IL')
Airport.create(code: 'ATL', name: 'Hartsfield-Jackson Atlanta International Airport', location: 'Atlanta, GA')
Airport.create(code: 'DFW', name: 'Dallas/Fort Worth International Airport', location: 'Dallas, TX')
Airport.create(code: 'DEN', name: 'Denver International Airport', location: 'Denver, CO')
# add more airpor


departure_airports = Airport.pluck(:id)
arrival_airports = Airport.pluck(:id)

date = Date.today
# Flight.delete_all

100.times do
  departure_airport_id = departure_airports.sample
  arrival_airport_id = arrival_airports.sample
  
  start_datetime = date + rand(24).hours
  duration = rand(1..12).hours
  
  Flight.create(departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id, start_datetime: start_datetime, duration: duration)
end
