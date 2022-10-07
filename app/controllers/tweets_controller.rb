class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_tweet, only: [:edit, :update, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    unless @tweet.save
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    unless @tweet.update(tweet_params)
      redirect_to action: :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)  
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
