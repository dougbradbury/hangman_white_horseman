require File.dirname(__FILE__) + '/../spec_helper'

require 'white_horseman/word_hueristics'

describe WhiteHorseman::WordHueristics do
  it "should description count letters in words" do
    @hueristics = WhiteHorseman::WordHueristics.new
    @hueristics.add_word(["a"])
    @hueristics.add_word(%w(a b))
    @hueristics.add_word(%w(a b c))
    @hueristics.add_word(%w(a b c d))
    @hueristics.top_letter.should == ["a"]
  end
    
  it "should only count a letter once per word" do
    @hueristics = WhiteHorseman::WordHueristics.new
    @hueristics.add_word(["a"])
    @hueristics.add_word(["a", "b", "a"])
    @hueristics.add_word(%w(a b c a a))
    @hueristics.add_word(%w(a b c d a a))
    
    @hueristics.top_letter.should == ["a"]
  end
  
  it "should return multiple if there is a tie" do
    @hueristics = WhiteHorseman::WordHueristics.new
    @hueristics.add_word(["a", "b"])
    @hueristics.add_word(["a", "b", "a"])
    @hueristics.add_word(%w(a b c a a))
    @hueristics.add_word(%w(a b c d a a))
    
    @hueristics.top_letter.should == ["a", "b"]    
  end
end
