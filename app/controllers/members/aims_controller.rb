class Members::AimsController < ApplicationController

  def edit
   @member = current_member
   @aim = @member.aim
  end

  def update
    @member = current_member
    @aim = @member.aim
    @aim.update(aim_params)
    redirect_to edit_aim_path(@aim.id)
  end


  private

  def aim_params
    params.require(:aim).permit(:aim_w, :aim_bf, :aim_mus, :aim_sm)
  end

end
