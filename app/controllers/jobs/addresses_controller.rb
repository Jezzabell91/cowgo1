class Jobs::AddressesController < AddressesController
    before_action :set_addressable

    private

    def set_addressable
        @addressable = Job.find(params[:job_id])
    end
end

