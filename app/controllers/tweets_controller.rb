class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "つぶやき撤回！"
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    # Tweet.create(tweets_params)
    @tweet = Tweet.create(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "つぶやきわず！"
    else
      render action: 'new'
    end
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweets_params)
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
end
