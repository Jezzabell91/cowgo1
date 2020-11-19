class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:index]  
    before_action :set_users, only: [:show, :update, :edit, :new, :destroy, :accept_job, :complete_job]
    before_action :set_job, only: [:show, :update, :edit, :destroy, :accept_job, :complete_job]


    # Shows Available Jobs 
    def index
        # If jobs have been accepeted they aren't shown in the available job list
        @jobs = Job.where(accepted: false)
        # visitors that haven't logged can view the list of jobs 
        unless current_user.nil?
            # the list of available jobs is curated for transporters so that only ones where they have the capacity are shown to them
            # database is queried using select
            if current_user.transporter_role == true && current_user.capacity.nil? == false
                @jobs = @jobs.select { |job| job.weight <= current_user.capacity }
                if @jobs.empty?
                    #If their are no jobs they are eligible an alert is shown
                    flash.now[:alert] = 'There are no jobs that are available with your current capacity'
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
        # the current user is the one posting so they are attached to the job
        @job.user_ids = current_user.id
        @job.save
        redirect_to job_path(@job.id)  
    end

    def update
        @job.update(job_params)
        redirect_to job_path(@job.id) 
    end

    # If user didn't post the job they can't edit it. Authorisation based on ownership of job. 
    # The first user attached to a job will always be the user that created the job 
    def edit 
        @jobs = Job
        if current_user && @job.users.first.id == current_user.id
            render 'edit'
        else
            redirect_to root_path
        end
    end

    def destroy
        @job.destroy
        redirect_to users_jobs_path(current_user.id)
    end

    def accept_job
        if @job.users.count == 1
          @job.update(accepted: true)
        #   Add the transporter that accepts to the job
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
            addresses_attributes: [ :job_id, :street_number, :street_name, :state, :postcode]
        )
    end

end
