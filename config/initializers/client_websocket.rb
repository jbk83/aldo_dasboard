# require 'faye/websocket'
# require 'eventmachine'
# require 'json'

# module AldoDashboard
#   class Application < Rails::Application
#     config.after_initialize do
#       puts "init"
#       EM.run {
#         ws = Faye::WebSocket::Client.new('ws://localhost:8080/')
      
#         ws.on :message do |event|
#           p JSON.parse(event.data)
#         end
#       }
#     end
#   end
# end