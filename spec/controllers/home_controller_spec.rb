require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #index" do
    it "does returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
