class Api::V1::QuotesController < Api::V1::ApiController
  def index
    begin
      @quotes = Quote.get_by_tag_name(params[:tag])
    
    rescue => error
      render json: {
        status: 500,
        message: error.message,
      }, status: 500
    end
  end
end
