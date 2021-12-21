class HomesController < ApplicationController
  
  def top
  end
  
  def about
  end
  
  # def about_me
  # end
  
  # def how
  # end
  
  #退会機能
  def unsubscribe
    @member = Member.find_by(name: params[:name])
  end

  def withdraw
    @member = Member.find(params[:id])
    @member.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  
  
end
