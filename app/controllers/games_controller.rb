require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @characters = ('A'..'Z').to_a
    @letters = []
    10.times do
      @location = rand(24)
      @letters.push(@characters[@location])

    end

  end

  def score
    @word = params[:word]
    uri = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    # @output = uri
    @output = JSON.parse(uri.read)
    if @output["found"] == true
      @message = "Congratulations! #{@word} is a valid english word"
    else
      @message = "Sorry, but #{@word} is not a valid english word"
    end
    @stuff = params[:board]
    #raise
  end
end
