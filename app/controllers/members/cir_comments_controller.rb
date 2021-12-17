class Members::CirCommentsController < ApplicationController
  
  def create
    circle = Circle.find(params[:circle_id])
    comment = current_member.cir_comments.new(cir_comment_params)
    comment.circle_id = circle.id
    comment.save
    redirect_to circle_path(circle)
  end

  def destroy
  end

  private

  def cir_comment_params
    params.require(:cir_comment).permit(:comment)
  end
end
