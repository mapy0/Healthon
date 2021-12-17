class Members::RelationshipsController < ApplicationController
    before_action :set_member

  def create
    member = Member.find(params[:relationship][:follow_id])
    following = current_member.follow(member)
    if following.save
      flash[:success] = 'Sucsess Follow:)!'
      redirect_to member
    else
      flash.now[:alert] = 'False Follow:('
      redirect_to member
    end
  end

  def destroy
    member=Member.find(params[:relationship][:follow_id])
    following = current_member.unfollow(member)
    if following.destroy
      flash[:success] = 'Unfollow'
      redirect_to member
    else
      flash.now[:alert] = 'False Unollow:('
      redirect_to member
    end
  end

end
