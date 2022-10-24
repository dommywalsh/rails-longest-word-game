class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('a'..'z').to_a.sample }
  end

  def score
    @word = params[:word]
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
    # .all? returns boolean true if all the objects in the enumerable satisfies the given condition.
    # if all the characters of word meet a certain criteria, return boolean
    # find the count of each letter in word and check if its greater than or equal
    # to the count of those individual letters in all letters provided in the grid...
  end
end
