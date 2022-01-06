class Members::RecCommentsController < ApplicationController

  def create
    @record = Record.find(params[:record_id])
    # @rec_comment = RecComment.new
    @comment = @record.rec_comments.build(rec_comment_params)
    @comment.score = Language.get_data(rec_comment_params[:comment])
    @comment.member_id = current_member.id
    if 
       @comment.score > 0
       @comment.save
    end
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
