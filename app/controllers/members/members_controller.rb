class Members::MembersController < ApplicationController
  before_action :authenticate_member!

 def show
   @membr = Member.find(params[:id])
 end

 def edit
    @membr = Member.find(params[:id])
 end
  
  
end
