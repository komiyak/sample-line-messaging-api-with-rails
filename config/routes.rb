Rails.application.routes.draw do
  resources :posts
  scope :line_messaging_api_callback do
    root to: 'line_messaging_api_callback#index', via: [:get, :post]
  end
end
