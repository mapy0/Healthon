class Members::ProfilesController < ApplicationController

  def edit
   @member = current_member
   @profile = @member.profile
  end

  def update
    @member = current_member
    @profile = @member.profile
    @profile.update(profile_params)
    redirect_to edit_profile_path(@profile.id)#redirect先は考えること
  end


  private

  def profile_params
    params.require(:profile).permit(:height, :birth, :age, :sex)
  end

end
