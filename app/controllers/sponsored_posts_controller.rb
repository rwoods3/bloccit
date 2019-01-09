class SponsoredPostsController < ApplicationController
  def show
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@sponsored_post = SponsoredPost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    #@sponsored_post = SponsoredPost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)
    @sponsored_post = SponsoredPost.new(sponsored_posts_params)

    # @sponsored_post.title = params[:sponsored_post][:title]
    # @sponsored_post.body = params[:sponsored_post][:body]
    # @sponsored_post.body = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :new
    end
  end

  def edit
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.update_attributes(sponsored_posts_params)
      flash[:notice] = "Sponsored Post was updated."
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error updating the sponsored post. Please try again."
      render :edit
    end
  end

  private
  def sponsored_posts_params
    params.require(:sponsored_post).permit(:title, :body, :price)
  end
end
