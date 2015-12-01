require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      # get :new
      # expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:params) do
    {
      post: {
        body: "Something something something"
      }
    }
    end

    it "redirects to index page" do
      # post :create, params
      # expect(subject).to redirect_to posts_path
    end
  end
end
