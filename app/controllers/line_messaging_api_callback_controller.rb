class LineMessagingApiCallbackController < ApplicationController
  protect_from_forgery except: :index

  def index
    head :ok
  end
end
