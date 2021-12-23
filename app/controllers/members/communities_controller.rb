class Members::CommunitiesController < ApplicationController
  
  #newとCreateは不要？
  def new
    @community = Community.new
    @community.members << current_member #多分ここも違う
  end

   def create
    @community = Community.new(community_params)
      if @community.save!
        redirect_to circles_path, notice: 'Create Sucsess :)!!'
      else
        render :new, alert: 'Create false :('
      end
   end
  
  
  
  def show
    @community = Community.find(params[:id])
    @members = Member.find(@community.member_ids)
    @cir_comment = CirComment.new
  end

  def join
   @community = Community.find(params[:id])
   @circle.members << current_member #ここを自動振り分けしたい
  end


  private
  def community_params
    params.require(:community).permit(:name, :image, member_id: [])
  end

  def com_comment_params
    params.require(:com_comment).permit(:comment)
  end
  

end
