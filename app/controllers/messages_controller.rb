class MessagesController < ApplicationController

    def create
        @user = User.find(params[:message][:user_id])
        @listing = Listing.find(params[:message][:listing_id])
        @listing.messages.create({
            user_id: params[:message][:user_id],
            message: params[:message][:message]
        })

        redirect_to show_listing_path(@listing.id)
    end

    private

    def message_params
        params.require(:message).permit(:message)
    end
end
