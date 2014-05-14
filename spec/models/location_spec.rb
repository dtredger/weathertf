# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#  address    :string(255)
#  user_id    :integer
#

require 'spec_helper'

describe Location do
  before { @location = FactoryGirl.create(:location) }

  context "model" do
    subject { @location }

    it { should respond_to(:address) }
    it { should respond_to(:latitude) }
    it { should respond_to(:longitude) }

    it { should respond_to(:user_id) }
  end

  context "on user creation" do
    describe "with lat/lon" do
      it "creates ForwardLocation" do
        pending
      end
    end

    describe "with address" do
      it "creates ReverseLocation" do
        pending
      end
    end
  end




end
