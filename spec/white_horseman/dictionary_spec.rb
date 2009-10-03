require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require 'white_horseman/dictionary'

describe WhiteHorseman::Dictionary do
  before(:each) do
    @dictionary = WhiteHorseman::Dictionary.new(["one", "three", "two", "throw"])
    @hueristics = mock("heuristics", :add_word => nil)
  end

  it "should get words matching a pattern" do
    result = @dictionary.words_matching("thr__", [], @hueristics)
    result.include?("three").should == true
    result.include?("throw").should == true
    result.include?("two").should == false
  end
  
  it "should exclude words containing certian letters" do
    result = @dictionary.words_matching("thr__", ["e"], @hueristics)
    result.include?("three").should == false
    result.include?("throw").should == true
  end
  
  it "should reset" do
    @dictionary.reset
  end
  
  it "should update hueristics as it goes" do
    @hueristics.should_receive(:add_word).with(["e", "e"])
    @hueristics.should_receive(:add_word).with(["o", "w"])

    result = @dictionary.words_matching("thr__", [], @hueristics)    
  end
end