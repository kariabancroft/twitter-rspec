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
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:post_something) do
      Post.create(body: "Test")
    end

    it "renders the show view" do
      get :show, id: post_something.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
    {
      post: {
        body: "Something something something"
      }
    }
    end

    let (:bad_params) do
      {
        post: {}
      }
    end

    it "redirects to index page" do
      subject { post :create, good_params }

      # Same as above
      # post :create, params

      # Success case to index page
      expect(subject).to redirect_to posts_path
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end
end
