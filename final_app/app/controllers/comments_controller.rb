class CommentsController < ApplicationController

  def destroy
    @comment = Comment.find_by(id: params[:id])

    respond_to do |format|
      format.html do
        redirect_to event_path(@comment.event)
      end
      format.js do
      end
    end
  end

  def create
    comment_params = params.require(:comment).permit(:user_id, :event_id, :content)
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.date = DateTime.now
    @comment.save

    respond_to do |format|
      format.html do
        redirect_to event_path(params[:comment][:event_id])
      end
      format.js do
      end
    end
  end
end