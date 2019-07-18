class PagesController < ApplicationController
  before_action :verify_password, only: [:update]
  before_action :set_user


  def friends
    @friends = User.all
  end

  def edit
    @user.build_user_profile if @user.user_profile.blank?
  end

  def update
    if @user.update(params_user)
      bypass_sign_in(@user)
      redirect_to profile_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit
    end    
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation,
    user_profile_attributes: [:id, :name, :avatar])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
       params[:user].extract!(:password, :password_confirmation)
    end
  end


end