class LineController < ApplicationController
  protect_from_forgery except: :send_message

  def send_message
    render json: { code: 'ok' }
  end
end
