class Api::ImagesController < ApplicationController
  def show
    input = params[:input]
    response = HTTP.headers(
      "Authorization" => "Client-ID #{ENV["IMG_API_KEY"]}"
      ).get("https://api.unsplash.com/search/photos?page=1&query=#{input}")
    @image = response.parse

    render "show.json.jbuilder"
  end
end
