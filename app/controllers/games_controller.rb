class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'...'z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')

    outside = false
    @word.split('').each do |letter|
      outside = @letters.none? letter
    end

    @outside = in_word? 
    @found = valid_english?
  end

  private

  def in_word?
    @word.split('').each do 
  end

  def valid_english?
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = RestClient.get(url)
    json = JSON.parse(response, symbolize_names: true)
    json[:found]
  end

end
