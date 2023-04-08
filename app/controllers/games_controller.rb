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
    @word = params[:word].upcase
    @board = params[:board].split
    @words = @word.split('')
    @status = []
    @words.each do |c|
      @board.include?(c) ? @status.push(true) : @status.push(false)
    end
    if @status.include?(false)
      @message = "Word isn't on board"
    else
      uri = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
      @output = JSON.parse(uri.read)
      if @output['found'] == true
        @message = "Congratulations! #{@word} is a valid english word"
      else
        @message = "Sorry, but #{@word} is not a valid english word"
      end
    end
  end
end
