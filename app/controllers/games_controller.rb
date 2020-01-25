class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'...'z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')

    found = false
    @word.split('').each do |letter|
      found = @letters.none? letter
    end
    @found = found

    if found
      @answer = "Sorry, but #{@word} can't be built out of #{@letters.join(', ')}"
    else
      url = "https://wagon-dictionary.herokuapp.com/#{@word}"

      response = RestClient.get(url)
      json = JSON.parse(response)

      if json['found']
        @answer = "Congratulations! #{@word} is a valid English word!"
      else
        @answer = "Sorry but #{@word} does not seem to be a valid English word..."
      end

    end
  end

end
