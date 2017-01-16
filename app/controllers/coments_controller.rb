class ComentsController < ApplicationController
    before_action :correct_user,   only: :destroy

    #Method creates comment to given news, with content from params, setting author as currently logged user
    def create
      @newComment = Coment.create(news_params)
      @newComment.user_id= current_user.id
      if @newComment.save
        flash[:success] = "Komentarz dodany"
        redirect_to :back
      else
        flash[:danger] = "Komentarz nie może być pusty"
        redirect_to :back
      end
    end

    #Method destroys comment
    def destroy
        @coment.destroy
        flash[:success] = "Komentarz usunięty"
        redirect_to request.referrer || root_url
    end


  private
    def news_params
      params.require(:coment).permit(:content,:news_id)
    end
    
    def correct_user
      @coment = Coment.find_by(id: params[:id])
    end
end
