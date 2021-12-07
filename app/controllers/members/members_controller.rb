class Members::MembersController < ApplicationController
  before_action :authenticate_member!

 def show
   @member = Member.find(params[:id])
 end

 def edit
   @member = Member.find(params[:id])
 end
  
  
end
