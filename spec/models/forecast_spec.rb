require 'spec_helper'

describe Forecast do

  before do
    @forecast = FactoryGirl.build(:forecast)
  end

  context "model" do
    subject { @forecast }

    it { should respond_to(:time) }
    it { should respond_to(:latitude) }
    it { should respond_to(:longitude) }
    
    it { should respond_to(:summary) }
    it { should respond_to(:user_id) }

    describe "precipitation data" do
      it { should respond_to(:precipIntensity) }
      it { should respond_to(:precipProbability) }
      it { should respond_to(:precipType) }
    end

    describe "temp/humidity data" do
      it { should respond_to(:temperature) }
      it { should respond_to(:humidity) }
      it { should respond_to(:visibility) }
    end
  end

  context "missing field" do
    describe "time" do
      no_time = FactoryGirl.build(:forecast, time: nil)
      subject { no_time }
      it { should_not be_valid }
    end

    describe "latitude" do
      no_latitude = FactoryGirl.build(:forecast, latitude: nil)
      subject { no_latitude }
      it { should_not be_valid }
    end

    describe "longitude" do
      no_longitude = FactoryGirl.build(:forecast, longitude: nil)
      subject { no_longitude }
      it { should_not be_valid }
    end

    describe "precipitation data" do
      no_precipitation_info = FactoryGirl.build(:forecast, 
        precipIntensity: nil, precipProbability: nil, precipType: nil)
      subject { no_precipitation_info }
      it { should be_valid }
    end

    describe "temp/humidity data" do
      no_temp_data = FactoryGirl.build(:forecast, 
        temperature: nil, humidity: nil, visibility: nil)
      subject { no_temp_data }
      it { should be_valid }
    end
  end



end

  