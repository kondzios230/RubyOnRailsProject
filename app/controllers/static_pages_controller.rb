class StaticPagesController < ApplicationController
  def home
    @news =News.paginate(page: params[:page])
  end
end
