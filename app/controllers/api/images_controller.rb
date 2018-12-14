class Api::ImagesController < ApplicationController
  def show
    input = params[:input]
    response = HTTP.headers(
      "Authorization" => "Client-ID c275470b58521e5d9ec1c02f13e3c9739eab8ab640dafa9fccf5f9d262b9c490"
      ).get("https://api.unsplash.com/search/photos?page=1&query=#{input}")
    @image = response.parse

    render "show.json.jbuilder"
  end
end
