require 'faye/websocket'
require 'eventmachine'
require 'json'
require File.expand_path('../../../config/environment',  __FILE__)

EM.run {
  ws = Faye::WebSocket::Client.new('ws://socket_server:8080/')

  ws.on :message do |event|
    json = JSON.parse(event.data, { symbolize_names: true })
    WsResolver.new.resolve(json).call
  end
}