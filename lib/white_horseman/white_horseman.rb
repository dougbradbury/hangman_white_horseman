require 'white_horseman/word_hueristics'
require 'white_horseman/dictionary'
module WhiteHorseman
  class WhiteHorseman

    def initialize
      
    end

    def word_list=(list)
      @dictionary = Dictionary.new(list)
    end

    def new_game(guesses_left)
      @guesses = []
      @dictionary.reset
    end
    def pick_one(top)
      top[rand(top.size)]
    end

    def guess(word, guesses_left)
      @counter = WordHueristics.new
      matches = @dictionary.words_matching(word, @guesses, @counter)
   
      guess = pick_one(@counter.top_letter)

      @guesses << guess            
      return guess
    end

    def incorrect_guess(guess)
    end

    def correct_guess(guess)
    end

    def fail(reason)
    end

    def game_result(result, word)
    end
  end
end