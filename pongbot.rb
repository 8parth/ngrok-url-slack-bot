require 'slack-ruby-bot'
require 'httparty'
require 'pry'

class PongBot < SlackRubyBot::Bot

  URL = 'http://localhost:4040/'
  command 'ping' do |client, data, match|
    api_url = 'api/tunnels'
    response = HTTParty.get(URL + api_url)
    
    client.say(text: response['tunnels'].first['public_url'], channel: data.channel)
  end
end

PongBot.run
