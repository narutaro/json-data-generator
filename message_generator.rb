require 'optparse'
require 'json'
require 'date'

class Message
  def initialize
    @message = {}
    @temperature = 100
    @humidity = 100 
  end

  def device_id
    id = [*1..10]
    id[rand(id.size)]
  end

  def update(value)
    (value + rand(-2.0..2.0)).round(2)
  end

  def generate
    @message[:device_id] = "device_" + device_id.to_s
    @message[:device_time] = DateTime.now.strftime('%Q') 
    @message[:temperature] = update(@temperature)
    @message[:humidity] = update(@humidity)
    @message.to_json
  end
end

if $0 == __FILE__
  option = {}
  OptionParser.new do |opt|
    opt.on('-c integer', '--count integer', Integer, 'message count') { |v| option[:c] = v.to_i }
    opt.on('-i float', '--interval', Float, 'message interval') { |v| option[:i] = v.to_f }
    opt.on('-d string', '--destination', String, 'pipe destination (eg. mosquitto_pub)') { |v| option[:d] = v }
    opt.parse!(ARGV)
  end

  message_count = option[:c]
  message_interval = option[:i]
  pipe_destination = option[:d]
  
  io = Kernel.open("| #{pipe_destination}", "w")

  m = Message.new
  message_count.times do 
    sleep message_interval
    #puts m.generate
    io.puts m.generate
  end
end
