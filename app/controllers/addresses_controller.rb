class AddressesController < ApplicationController
# AddressesController is the super class for Users::AddressesController and Jobs::AddressesController
# @addressable becomes a user or a job depending on which subclass 

    def new
        @address = @addressable.addresses.new
    end

    def create
        @address = @addressable.addresses.new(address_params)
        @addressable.save
        redirect_to @addressable, notice: "Address added"
    end

    private

    #Sanitize address parameters
    def address_params
        params.require(:address).permit(:street_number, :street_name, :state, :postcode)
    end
end

