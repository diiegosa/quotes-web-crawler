class Api::V1::CrawlersController < Api::V1::ApiController
  def pull
    begin
      status = 200
      message = 'DATA SAVED SUCCESSFULLY' 
      Crawler.pull
    
    rescue => error
      status = 500
      message = error.message
    
    ensure
      render json: {
        status: status, 
        message: message, 
      }, status: status
    end
  end
end
