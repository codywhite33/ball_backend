class Api::DefinitionsController < ApplicationController
  def definition
    input = params[:input]
    response = HTTP.headers(
      "X-RapidAPI-Key" => ENV["RAPID_API_KEY"],
      "content-type" => "application/json; charset=utf-8"
      ).get("https://wordsapiv1.p.rapidapi.com/words/#{input}")
    @definition = response.parse
    render "show.json.jbuilder"
    
  end
end
