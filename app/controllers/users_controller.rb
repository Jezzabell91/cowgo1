class UsersController < ApplicationController
before_action :get_user, only: [:profile, :create_profile]
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

  def profile
    if current_user && @user.id == current_user.id
      render 'profile'
    else
      redirect_to root_path  
    end
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
end
