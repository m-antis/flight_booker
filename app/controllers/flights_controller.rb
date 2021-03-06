class FlightsController < ApplicationController 

  def index
    if params[:flight]
      if params[:flight][:from_airport] == params[:flight][:to_airport]
        flash.keep[:notice] = "To and from airports must be different"
        redirect_to :root
      else
        @flights = Flight.where(
          from_airport_id: params[:flight][:from_airport],
          to_airport_id: params[:flight][:to_airport],
          start: Date.strptime(params[:flight][:start], '%m/%d/%Y')).all
      end
    end
  end 

end

