class Api::SearchesController < ApplicationController
  def create
    @search = Search.new(input: params[:input], terms: params[:terms])

    @output_array = []

    if @search.terms == "similar"
      response = HTTP.get("http://api.datamuse.com/words?ml=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "rhyme"
      response = HTTP.get("http://api.datamuse.com/words?rel_rhy=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "sound"
      response = HTTP.get("http://api.datamuse.com/words?sl=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "adjective"
      response = HTTP.get("http://api.datamuse.com/words?rel_jjb=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "noun"
      response = HTTP.get("http://api.datamuse.com/words?rel_jja=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "opposite"
      response = HTTP.get("http://api.datamuse.com/words?rel_ant=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "generalize"
      response = HTTP.get("http://api.datamuse.com/words?rel_gen=#{@search.input}")
      @output_array = response.parse
    end
      
    @search.save
    render json: {search: @output_array}
  end

  def show
    @search = Search.find_by(id: params[:id])

    @output_array = []


    if @search.terms == "similar"
      response = HTTP.get("http://api.datamuse.com/words?ml=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "rhyme"
      response = HTTP.get("http://api.datamuse.com/words?rel_rhy=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "sound"
      response = HTTP.get("http://api.datamuse.com/words?sl=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "adjective"
      response = HTTP.get("http://api.datamuse.com/words?rel_jjb=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "noun"
      response = HTTP.get("http://api.datamuse.com/words?rel_jjb=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "opposite"
      response = HTTP.get("http://api.datamuse.com/words?rel_ant=#{@search.input}")
      @output_array = response.parse
    elsif @search.terms == "generalize"
      response = HTTP.get("http://api.datamuse.com/words?rel_gen=#{@search.input}")
      @output_array = response.parse
    end

    render json: {search: @output_array}

    
  end
end
