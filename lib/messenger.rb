require 'twilio-ruby'

class Messenger

  attr_accessor :client

  def initialize
    @sid = ENV['TWILIO_SID']
    @token = ENV['TWILIO_TOKEN']
    @client_class = client_class
    @client = Twilio::REST::Client.new(@sid, @token)
    @from = ENV['TWILIO_FROM']
  end

  def send_message(to, body)
    client.messages.create(
    from: @from,
    to: to,
    body: body
    )
  end
end
