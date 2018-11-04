class PagesController < ApplicationController
    protect_from_forgery with: :null_session
    layout "relevators"

    def quote_post
        @quote = Quote.new(quote_params)

        respond_to do |format|
        if @quote.save
            format.html  {  redirect_to '/quote', notice: 'We received your request, we will contact you ASAP!' }
            format.json  { render json: Quote.create(quote_params) }
        else
            format.html  {  redirect_to '/quote', notice: 'Please fill all the required fields.' }
            format.json  { render :json => @quote.errors, :status => :unprocessable_entity }
        end
    end
end
        private def quote_params
            params[:resQuote][:value] = "Residential"
          params.require(:resQuote).permit!
        end

        def comm_post
            @quote = Quote.new(comm_params)
    
            respond_to do |format|
                if @quote.save
                    format.html  {  redirect_to '/quote', commnotice: 'We received your request, we will contact you ASAP!' }
                    format.json  { render json: Quote.create(comm_params) }
                else
                    format.html  {  redirect_to '/quote', commnotice: 'Please fill all the required fields.' }
                    format.json  { render :json => @quote.errors, :status => :unprocessable_entity }
                end
            end
        end
            private def comm_params
                params[:commQuote][:value] = "Commercial"
              params.require(:commQuote).permit!
            end

            def cor_post
                @quote = Quote.new(cor_params)
        
                respond_to do |format|
                if @quote.save
                    format.html  {  redirect_to '/quote', cornotice: 'We received your request, we will contact you ASAP!' }
                    format.json  { render json: Quote.create(cor_params) }
                else
                    format.html  {  redirect_to '/quote', cornotice: 'Please fill all the required fields.' }
                    format.json  { render :json => @quote.errors, :status => :unprocessable_entity }
                end
            end
        end
                private def cor_params
                    params[:corpQuote][:value] = "Corporative"
                  params.require(:corpQuote).permit!
                end

                def hyb_post
                    @quote = Quote.new(hyb_params)
            
                    respond_to do |format|
                    if @quote.save
                        format.html  {  redirect_to '/quote', hybnotice: 'We received your request, we will contact you ASAP!' }
                        format.json  { render json: Quote.create(hyb_params) }
                    else
                        format.html  {  redirect_to '/quote', hybnotice: 'Please fill all the required fields.' }
                        format.json  { render :json => @quote.errors, :status => :unprocessable_entity }
                    end
                end
            end
                    private def hyb_params
                        params[:hybQuote][:value] = "Hybrid"
                      params.require(:hybQuote).permit!
                    end

        def contact_us_post
            @contact_us = Lead.new(contact_us_params)
            binary_content = IO.binread(contact_us_params[:File].path)
            @contact_us.File = binary_content.encoding
            if @contact_us.save
                render status: 200, json: @contact_us.to_json
            end    

        end

        private def contact_us_params
            params.require(:contact_us).permit!
        end

end
