class UsersController < ApplicationController
before_action :get_user, only: [:profile, :create_profile, :edit_profile, :update_profile, :livestock_owner_role, :transporter_role, :choose_role, :create_address]
before_action :authenticate_user!, except: [:index, :show]  

  def edit_profile
    if current_user && @user.id == current_user.id
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def create_profile
    if current_user && @user.id == current_user.id
      render 'create_profile'
    else
      redirect_to root_path  
    end
  end

  def create_address
    if current_user && @user.id == current_user.id
      render 'create_address'
    else
      redirect_to root_path  
    end
  end

  def update_profile
    @user.update(user_profile_params)
    if @user.addresses.empty?
      render 'create_address'
    else
      redirect_to profile_path(@user)
    end
  end

  def choose_role
    if current_user && @user.id == current_user.id
      render 'choose_role'
    else
      redirect_to root_path  
    end
  end

  def livestock_owner_role
    if current_user && @user.id == current_user.id
      @user.update(livestock_owner_role: true)
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def transporter_role
    if current_user && @user.id == current_user.id
      @user.update(transporter_role: true)
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def profile
      render 'profile'
  end
  
  def edit
    
  end

  def update
    
  end

  def show
    redirect_to action: 'profile'
  end

  def destroy
    
  end



  private 

  def get_user 
    @user = User.find(params[:id])
  end

  def user_profile_params
    params.require(:user).permit(
      :company,
      :website,
      :description,
      :range,
      :capacity,
      :profile_image
    )
  end
end
