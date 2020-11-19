class AddressesController < ApplicationController

    def new
        @address = @addressable.addresses.new
    end

    def create
        @address = @addressable.addresses.new(address_params)
        @addressable.save
        redirect_to @addressable, notice: "Address added"
    end

    private

    def address_params
        params.require(:address).permit(:street_number, :street_name, :state, :postcode)
    end
end

