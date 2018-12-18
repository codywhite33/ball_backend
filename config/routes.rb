Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    get "/search/:input" => "searches#show"
    post "/search" => "searches#create"

    get "/definitions/:input" => "definitions#definition"

    get "/images/:input" => "images#show"
  end
end
