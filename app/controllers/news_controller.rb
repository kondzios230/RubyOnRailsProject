class NewsController < ApplicationController
   # before_action :logged_in_user, only: [:create, :destroy]
    def show
        @news = News.find(params[:id])
    end
    def create
    @news = current_user.news.build(news_params)
    if @news.save
      flash[:success] = "News created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  def new
        @news = current_user.news.build if logged_in?
  end
  def destroy
  end

  private

    def news_params
      params.require(:news).permit(:content, :title)
    end
end
