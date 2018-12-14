class Api::DefinitionsController < ApplicationController
  def definition
    input = params[:input]
    response = HTTP.headers(
      "X-RapidAPI-Key" => "uNd1hIiplwmshav5dtL418LJNgpXp1PgjnEjsnqbFZMvT38URH",
      "content-type" => "application/json; charset=utf-8"
      ).get("https://wordsapiv1.p.rapidapi.com/words/#{input}")
    @definition = response.parse
    render "show.json.jbuilder"
    
  end
end
