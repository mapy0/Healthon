class Members::MembersController < ApplicationController
  before_action :authenticate_member!

 def show
   @member = Member.find(params[:id])
 end

 def edit
   @member = Member.find(params[:id])
 end
  
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end

  private

  def member_params
    params.require(:member).permit(:name, :image, :self_introduction)
  end
  
  
  
end
