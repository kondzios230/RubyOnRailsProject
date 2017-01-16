class NewsController < ApplicationController
    before_action :correct_user,   only: :destroy

    #Method shows selected news, find it's comments and creates empty new one 
    def show
        @news = News.find(params[:id])
        @coments = Coment.where(:news_id => @news.id)
        @newComment = Coment.new        
        @newComment.news_id=@news.id
    end
    
    #Method creates news from params and saves it
    def create
      @news = current_user.news.build(news_params)
      if @news.save
        flash[:success] = "News dodany"
        redirect_to root_url
      else
        render "new"
      end
    end

    #Method creates empty news
    def new
          @news = current_user.news.build if logged_in?
    end

    #Method return news found by given id
    def edit
      @news = News.find(params[:id])
    end

    #Method updates news and saves it
    def update
      @news = News.find(params[:id])
      if @news.update_attributes(news_params)
        flash[:success] = "News zauktualizowany"
        redirect_to @news
      else
        flash[:danger] = "Uzupełnij wszystkie pola"
        redirect_to :back
      end
    end
    
    #Method destroyes news
    def destroy
        @news.destroy
        flash[:success] = "News usunięty"
        redirect_to request.referrer || root_url
    end

  private

    def news_params
      params.require(:news).permit(:content, :title)
    end
    def correct_user
      @news = News.find_by(id: params[:id])
    end
end
