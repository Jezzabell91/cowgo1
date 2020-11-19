class UsersController < ApplicationController
before_action :get_user, only: [:profile, :create_profile, :edit_profile, :update_profile, :livestock_owner_role, :transporter_role, :choose_role, :create_address, :users_jobs]
before_action :role_selected?, only: [:profile, :create_profile, :edit_profile, :update_profile, :choose_role, :create_address, :users_jobs]
before_action :authenticate_user!, except: [:index, :show]


  def edit_profile
    # Basic authorization to ensure user is only able to access their own account
    if current_user && @user.id == current_user.id
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def create_profile
    # Basic authorization to ensure user is only able to access their own account
    if current_user && @user.id == current_user.id
      render 'create_profile'
    else
      redirect_to root_path  
    end
  end

  def create_address
    # Basic authorization to ensure user is only able to access their own account
    if current_user && @user.id == current_user.id
      # If user already has an address they aren't able to add another
      if @user.addresses.empty?
        render 'create_address'
      else
        redirect_to root_path  
      end
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
      # Prevent users from adding both roles to their account 
      if current_user.transporter_role == true || current_user.livestock_owner_role == true
        flash.now[:alert] = 'You have already chosen a role'
      else
        # user role is livestock owner 
      @user.update(livestock_owner_role: true)
      end
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def transporter_role
    if current_user && @user.id == current_user.id
      # Prevent users from adding both roles to their account 
      if current_user.transporter_role == true || current_user.livestock_owner_role == true
        flash.now[:alert] = 'You have already chosen a role'
      else
         # user role is transporter
      @user.update(transporter_role: true)
      end
      render 'edit_profile'
    else
      redirect_to root_path  
    end
  end

  def profile
      render 'profile'
  end
  
  # Shows the jobs that the user has/belongs to 
  def users_jobs
    if current_user && @user.id == current_user.id
      render 'users_jobs'
    else
      redirect_to root_path  
    end
  end

  def accept_job
    redirect_to root_path 
  end

  def index
    redirect_to root_path 
  end

  def create
    redirect_to root_path 
  end

  def new
    redirect_to redirect_to root_path 
  end

  # Legacy code resulting from bad routing practices
  def edit
    redirect_to action: 'edit_profile'
  end

  def update
    
  end

  def show
    redirect_to action: 'profile'
  end

  def destroy
    
  end



  private 

  # If user clicks away from the role selection screen they will be brought back to it 
  def role_selected?
    if current_user
      if current_user.transporter_role == false && current_user.livestock_owner_role == false
        render 'choose_role'
      end
    end
  end

  # gets and sets the user based on passed params
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
      :profile_image,
      job_ids: []
    )
  end
end
