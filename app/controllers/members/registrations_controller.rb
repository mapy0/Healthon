# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
#Member 基本情報登録
 def create
    @member = Member.new(sign_up_params)
    unless @member.valid?
      flash.now[:alert] = @member.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {member: @member.attributes}
    #passwordはmember.attributeに入っていないので、個別で記述。
    session["devise.regist_data"][:member]["password"] = params[:member][:password]
    @profile = @member.build_profile
    render :new_profile
 end


  def create_profile
    @member = Member.new(member_params)
    @profile = Profile.new(profile_params)
    unless @profile.valid?
      flash.now[:alert] = @profile.errors.full_messages
      render :new_profile and return
    end
    @member.build_profile(@profile.attributes)
    session[:profile] = @profile.attributes
    @aim = @member.build_aim
    render :new_aim
  end

  def create_aim
    @member = Member.new(member_params)
    @member.build_profile(profile_params)
    @member.build_aim(aim_params)
    @member.save!
     sign_in(:member, @member)
     redirect_to member_path(@member.id)

    puts "---------------check--------------------"
    Rails.logger.debug @member.aim.inspect
    Rails.logger.debug @member.profile.inspect
    puts "---------------check---------------------"


  end




  protected

  def member_params
    params.require(:member).permit(:email, :password, :name, :password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:height, :birth, :age, :sex)
  end

  def aim_params
    params.require(:aim).permit(:aim_w, :aim_bf, :aim_mus, :aim_sm)
  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
