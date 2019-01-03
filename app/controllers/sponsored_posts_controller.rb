class SponsoredPostsController < ApplicationController
  def show
  	@sponsored_post = SponsoredPost.find(params[:topic_id], params[:id])
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@sponsored_post = SponsoredPost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)
  end

  def edit
  	@sponsored_post = SponsoredPost.find(params[:topic_id], params[:id])
  end
end
