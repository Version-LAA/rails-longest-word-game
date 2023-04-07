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

  end
end
