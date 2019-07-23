class CommentsController < ApplicationController



  def index
    
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(user_id: current_user.id, beer_id: params[:beer_id])
      if @comment.save
        redirect_to beers_path(@comment.user)
      else
        render :new
      end
    end

  def show
    @comment = Comment.find_by(params[:beer_id])
  end


  private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :beer_id)
    end

end
