require 'spec_helper'

describe ApplicationHelper do

  describe "page title" do

    it "should include specific page subtitle" do
      full_title("cool").should =~ /cool/
    end

    it "has base title and hyphen" do
      full_title("cool").should =~ /^WeatherPing - /
    end

    it "no hyphen without subtitle" do
      full_title("").should_not =~ /\-/
    end
  end

end

