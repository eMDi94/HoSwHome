# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


living_room = Sensor.create! code: '01', name: 'Temperatura Sala'
bed_room = Sensor.create! code: '02', name: 'Temperatura Camera da Letto'


10.times.each do |_|

  living_room_temp = rand(10.0..40.0)
  bed_room_temp = rand(10.0..40.0)

  Measurement.create! sensor: living_room, value: living_room_temp
  Measurement.create! sensor: bed_room, value: bed_room_temp

end

