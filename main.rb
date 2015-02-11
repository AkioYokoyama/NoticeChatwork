require 'json'
require './ChatworkApi.rb'

if !ARGV[0]
  p 'Please enter a messeage or task into the first argument!'
  exit(0)
end

chatwork_api = ChatworkApi.new
if !ARGV[1]
  response = chatwork_api.send_message(ARGV[0])
else
  response = chatwork_api.create_task(ARGV[0], ARGV[1])
end

JSON.parse(response.body).each do |key, value|
  puts "#{key} : #{value}"
end
