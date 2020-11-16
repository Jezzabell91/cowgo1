class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]  
    before_action :set_job, only: [:show, :update, :edit, :destroy, :create]
    before_action :set_users, only: [:show, :update, :edit, :new]

    def index
        @jobs = Job.all
    end
    

    def show
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.create(job_params)
        @job.user_id = current_user.id
        render
    end




    def update
        @job.update(job_params)
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
            :paid,
            :completed,
            user_ids: []
        )
    end

end
