require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:ad) { Advertisement.create! title: "Ad Title Test", copy: "Add Copy Test", price: 1.99 }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [ad] to @ads" do
      get :index  
      expect(assigns(:ads)).to eq([ad])
    end 
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
       get :show, params: { id: ad.id }
       expect(response).to render_template :show
     end
 
     it "assigns ad to @ad" do
       get :show, params: { id: ad.id }
       expect(assigns(:ad)).to eq(ad)
     end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @ad" do
      get :new
      expect(assigns(:ad)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of Advertisements by 1" do
      expect{ post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price } } }.to change(Advertisement,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price } }
      expect(assigns(:ad)).to eq Advertisement.last
    end

    it "redirects to the new post" do
      post :create, params: { advertisement: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price } }
      expect(response).to redirect_to Advertisement.last
    end
  end

end
