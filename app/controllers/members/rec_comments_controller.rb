class Members::RecCommentsController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    comment = current_member.rec_comments.new(rec_comment_params)
    comment.record_id = record.id
    comment.save
    redirect_to record_path(record)
  end

  def destroy
    Record.find_by(id: params[:id]).destroy
    redirect_to record_path(params[:record_id])
  end


  private

  def rec_comment_params
    params.require(:rec_comment).permit(:comment)
  end
end
