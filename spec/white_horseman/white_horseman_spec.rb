require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'white_horseman/white_horseman'

describe WhiteHorseman::WhiteHorseman do

  it "should be instantiable with no paramters" do

    lambda { WhiteHorseman::WhiteHorseman.new }.should_not raise_error

  end
  
  it "should play" do
    WhiteHorseman::WordHueristics.should_receive(:new).any_number_of_times.and_return(@hueristics = mock("hueristics"))
    @hueristics.should_receive(:top_letter).ordered.and_return(["b"], ["r"])

    WhiteHorseman::Dictionary.should_receive(:new).with(["one", "two", "three"]).and_return(@dictionary = mock("dictionary"))
    @dictionary.should_receive(:words_matching).with("___", [], @hueristics).and_return(["blah"])
    @dictionary.should_receive(:words_matching).with("___", ["b"], @hueristics).and_return(["blah"])
    @dictionary.should_receive(:reset)
        

    player = WhiteHorseman::WhiteHorseman.new
    player.word_list = ["one", "two", "three"]
    player.new_game(5)
    player.guess("___", 5).should == "b"
    player.guess("___", 4).should == "r"
  end

end