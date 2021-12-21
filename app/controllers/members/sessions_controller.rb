# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_member, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # before_action :member_path, only: [:create]

    def after_sign_out_path_for(resource)
        root_path
    end

    def after_sign_in_path_for(resource)
	      member_path(resource)
    end



  protected

  # 退会の有無判断するメソッド
  # 会員の論理削除のための記述。退会後は、同じアカウントの利用不可。
  def reject_member
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    # @member = Member.find_by(email: params[:member][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    # return if !@member
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    # if @member.valid_password?(params[:member][:password]) && @member.is_valid
    #   redirect_to member_path(@member)
    # else
    #   flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    #   redirect_to new_member_registration_path
    # end

    @member = Member.find_by(email: params[:member][:email])
    if @member
      if @member.valid_password?(params[:member][:password]) && !@member.is_valid
        redirect_to new_member_session_path
      end
    end
  end


end
