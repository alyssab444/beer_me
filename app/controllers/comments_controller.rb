class CommentsController < ApplicationController
before_action :current_user, only: [:new, :create]


  def index
  
  end

  def new
    @comment = Comment.new
  end

  def create
    @beer = Beer.find_by(params[:beer_id])
    @comment = @beer.comments.build(comment_params)
    @comment.user = current_user
      if @comment.save
        redirect_to beers_path#(@comment.user)
      else
        render :new
      end
    end

  def show
    @beer = Beer.find_by(params[:beer_id])
    @comments = @beer.comments
  end


  private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :beer_id)
    end

end
