class Members::RecCommentsController < ApplicationController

  def create
    @record = Record.find(params[:record_id])
    @rec_comment = RecComment.new
    @rec_comment.score = Language.get_data(list_params[:body])
    @comment = @record.rec_comments.build(rec_comment_params)
    @comment.member_id = current_member.id
    @comment.save
    #redirect_to record_path(record)
  end

  def destroy
    @record = Record.find(params[:record_id])
    RecComment.find_by(id: params[:id],record_id:params[:record_id]).destroy
    #redirect_to record_path(params[:record_id])
  end


  private

  def rec_comment_params
    params.require(:rec_comment).permit(:comment)
  end
end
