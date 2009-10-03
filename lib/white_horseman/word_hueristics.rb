module WhiteHorseman
  class WordHueristics
    def initialize()
      @count = {}
    end

    def top_pairs
      max = @count.values.max
      @count.select {|letter, count| count == max}
    end

    def top_letter            
      return top_pairs.collect{|pair| pair[0]}
    end    
    
    def add_word(letters)
      letters.uniq.each do |char|
        @count[char] ||= 0
        @count[char] += 1
      end
    end    
  end
end

