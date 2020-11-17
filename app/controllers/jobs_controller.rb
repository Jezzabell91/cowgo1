class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index]  
    before_action :set_users, only: [:show, :update, :edit, :new, :destroy, :accept_job, :complete_job]
    before_action :set_job, only: [:show, :update, :edit, :destroy, :accept_job, :complete_job]


    def index
        @jobs = Job.where(accepted: false)
        unless current_user.nil?
            if current_user.transporter_role == true
                @jobs = @jobs.select { |job| job.weight < current_user.capacity }
                if @jobs.empty?
                    flash.now[:alert] = 'There are no jobs that are available with your current capacity and range.'
                end
            end
        end 
        
    end
    

    def show
    end

    def new
        @job = Job.new
        @job.addresses.build
    end

    def create
        @job = Job.new(job_params)
        @job.user_ids = current_user.id
        @job.save
        redirect_to job_path(@job.id)  
    end

    def update
        @job.update(job_params)
        redirect_to job_path(@job.id) 
    end

    def edit 
        if current_user && @job.users.first.id == current_user.id
            render 'edit'
        end
    end

    def destroy
        @job.destroy
        redirect_to users_jobs_path(current_user.id)
    end

    def accept_job
        if @job.users.count == 1
          @job.update(accepted: true)
          @job.users.push(current_user)
          @job.save
          redirect_to users_jobs_path(current_user.id)
        else
          redirect_to root_path  
        end
    end

    def complete_job
          @job.update(completed: true)
          redirect_to users_jobs_path(current_user.id)
    end

    private

    def set_users
        @users = User.all
    end

    def set_job
        @job = Job.find(params[:id])
    end



    def job_params
        params.require(:job).permit(
            :head,
            :weight,
            :instructions,
            user_ids: [],
            addresses_attributes: [ :job_id, :street_number, :street_name, :state, :postcode, :country]
        )
    end

end
