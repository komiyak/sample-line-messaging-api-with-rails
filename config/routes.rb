Rails.application.routes.draw do
  resources :posts
  scope :line_messaging_api_callback do
    root to: 'line_messaging_api_callback#index', via: [:get, :post]
  end

  scope :line do
    post 'send_message', to: 'line#send_message'
  end
end
