desc 'Start the MQTT Listener'
task mqtt: ['environment'] do
  require 'mqtt'
  require 'json'

  puts 'Starting MQTT Client...'

  client = MQTT::Client.connect host: 'localhost', port: 1883
  client.subscribe 'measurements'

  puts 'Listening...'
  client.get do |topic,message|
    puts "Received message on topic #{topic}: #{message}"
    object = JSON.parse(message, object_class: OpenStruct)

    sensor = Sensor.find_by(code: object.sensor_code)
    sensor.measurements.create! value: object.value unless sensor.nil?
  end
end