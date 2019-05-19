class Api::V1::CommentsController < ApplicationController
    before_action :find_comment, only: [:update, :destroy]
    before_action :find_commentable


  def index
   @comments = Comment.all
   render json: @comments
  end



  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
   @comment.update(comment_params)
   if @comment.save
     render json: @comment, status: :accepted
   else
     render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
   end
  end


  def destroy
      @comment.delete
      render json: "comment deleted"
  end



  private

  def comment_params
   params.require(:comment).permit(:body, :likes, :username, :user_id)
  end

  def find_comment
   @comment = Comment.find(params[:id])
  end

  def find_commentable
    @commentable = Sighting.find_by_id(params[:sighting_id])
      if params[:sighting_id]
    @comentables = Comment.find_by_id(params[:comment_id])
      if params[:comment_id]
      end
    end
  end

end
