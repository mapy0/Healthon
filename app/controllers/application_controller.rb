class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :image_id])
  end

    #退会機能
    def unsubscribe
    @member = Member.find(name: params[:name])
    end

  def withdrawal
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def self.render_with_signed_in_member(member, *args)
       ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
       proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(member, scope: :member) }
       renderer = self.renderer.new('warden' => proxy)
       renderer.render(*args)
  end





end
