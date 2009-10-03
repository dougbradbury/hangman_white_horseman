module WhiteHorseman
  class Dictionary
    def initialize(word_list)
      @word_list = {}
      word_list.each do |word|
        size = word.length
        @word_list[size] ||= []
        @word_list[size] << word
      end
    end

    def words_matching(str, excludes, hueristics)
      lazy_init_possibles(str)
      @possibles = prune(excludes, hueristics, str)
    end
    
    def reset
      @possibles = nil
    end
    
    private
    
    def is_possible_word(match, excludes)
      match && (match.captures & excludes).empty?
    end

    def lazy_init_possibles(string)
      @possibles = @word_list[string.size] if @possibles.nil?
    end

    def add_if_match(excludes, hueristics, next_list, regex, word)
      match = word.match(regex)
      if is_possible_word(match, excludes)
        next_list << word
        hueristics.add_word(match.captures)
      end
    end

    def prune(excludes, hueristics, string)
      next_list = []
      regex = Regexp.new(string.gsub("_", "(.)"))
      @possibles.each do |word|
        add_if_match(excludes, hueristics, next_list, regex, word)
      end
      return next_list
    end

  end
end
