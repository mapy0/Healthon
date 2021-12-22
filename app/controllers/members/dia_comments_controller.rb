class Members::DiaCommentsController < ApplicationController

  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.dia_comments.build(dia_comment_params)
    @comment.member_id = current_member.id
    @comment.save
    redirect_to diary_path(@diary)
  end

  def destroy
    Diary.find_by(id: params[:id]).destroy
    redirect_to diary_path(params[:diary_id])
  end


  private

  def dia_comment_params
    params.require(:dia_comment).permit(:comment)
  end


end
