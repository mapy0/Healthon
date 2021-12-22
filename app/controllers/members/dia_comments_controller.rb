class Members::DiaCommentsController < ApplicationController

  def create
    @diary = Diary.find(params[:diary_id])
    @dia_comment = DiaComment.new
    @comment = @diary.dia_comments.build(dia_comment_params)
    @comment.member_id = current_member.id
    @comment.save
    #redirect_to diary_path(@diary)
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    DiaComment.find_by(id: params[:id],diary_id:params[:diary_id]).destroy
    #redirect_to diary_path(params[:diary_id])
  end


  private

  def dia_comment_params
    params.require(:dia_comment).permit(:comment)
  end


end
