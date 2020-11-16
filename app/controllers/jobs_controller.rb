class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]  
    before_action :set_users, only: [:show, :update, :edit, :new, :destroy]
    before_action :set_job, only: [:show, :update, :edit, :destroy]


    def index
        @jobs = Job.all
    end
    

    def show
    end

    def new
        @job = Job.new
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
            :address,
            user_ids: []
        )
    end

end
