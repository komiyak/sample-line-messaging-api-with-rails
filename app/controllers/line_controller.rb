require 'net/http'
require 'net/https'
require 'uri'

class LineController < ApplicationController
  protect_from_forgery except: :send_message

  def send_message
    return head :bad_request if params[:line_to].blank?

    uri = URI.parse('https://api.line.me/v2/bot/message/push')
    header = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{ENV.fetch('LINE_CHANNEL_ACCESS_TOKEN')}"
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = {
      to: params[:line_to],
      messages: [
        {
          type: 'text',
          text: 'hello!'
        }
      ]
    }.to_json

    response = http.request(request)

    render json: {
      code: 'ok',
      line_status: response.code,
      line_response: response.body
    }
  end
end
