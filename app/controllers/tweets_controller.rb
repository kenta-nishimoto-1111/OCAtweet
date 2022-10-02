class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    # 削除を送られてきたときに実行
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    # 編集されたデータを更新されるところ
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:name, :text)
  end
end
