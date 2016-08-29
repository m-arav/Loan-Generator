require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  describe "index" do
    it "GET has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "new" do
    it "GET has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

end
