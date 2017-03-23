require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "does not return http redirect" do
      get :index
      expect(response).to_not have_http_status(:redirect)
    end
  end

end
