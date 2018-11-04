class CommController < ApplicationController
    protect_from_forgery with: :null_session
    layout "relevators"

        def comm_post
            @quote = Quote.new(comm_params)
    
            respond_to do |format|
            if @quote.save
                format.html  {  redirect_to '/quote', notice: 'We received your request, we will contact you ASAP!' }
                format.json  { render json: Quote.create(comm_params) }
            else
                format.html  {  redirect_to '/quote', notice: 'Please fill all the required fields.' }
                format.json  { render :json => @quote.errors, :status => :unprocessable_entity }
            end
        end
    end
    
    private def comm_params
        params.require(:commQuote).permit!
    end
end 