class Members::ProfilesController < ApplicationController
  
  def edit
   @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    @profiler.update(profile_params)
    redirect_to edit_profile_path(@profile.id)#redirect先は考えること
  end

  private

  def member_params
    params.require(:profile).permit(:height, :birth, :age, :sex)
  end

end
