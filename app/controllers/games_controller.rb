class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'...'z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')
    @alert = ''

    outside = false
    @word.split('').each do |letter|
      outside = @letters.none? letter
    end
    @outside = outside
    @found = false

    if outside == false
      url = "https://wagon-dictionary.herokuapp.com/#{@word}"

      response = RestClient.get(url)
      json = JSON.parse(response)

      if json['found']
        @found = true
      else
        @found = false
      end
    end
    
  end

end
