require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "POST jadge" do
    it "returns http success" do
      post :jadge, age: 34, track_record: 16
      expect(response).to be_success
    end
  end

  describe "GET help" do
    it "returns http success" do
      get :help
      expect(response).to be_success
    end
  end
end
