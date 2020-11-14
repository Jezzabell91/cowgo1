class Users::AddressesController < AddressesController
    before_action :set_addressable

    private

    def set_addressable
        @addressable = User.find(params[:user_id])
    end
end