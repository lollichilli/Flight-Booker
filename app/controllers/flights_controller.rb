class FlightsController < ApplicationController

  def search
    @passenger_count = params[:passengers].to_i
    @airports = Airport.all.order(name: :asc)
  
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:date].present? && params[:passengers].present?
      @departure_airport = Airport.find(params[:departure_airport_id])
      @arrival_airport = Airport.find(params[:arrival_airport_id])
      puts "params[:date]: #{params[:date]}"
      # @date = Date.strptime(params[:date], '%Y-%m-%d')
      @passengers = params[:passengers].to_i
      puts "*****\n\nxxx141 #{params[:passengers]}*****\n\n"
      @flights = Flight.where(departure_airport: @departure_airport, arrival_airport: @arrival_airport)
  
      if @flights.none?
        flash.now[:alert] = 'No flights found for selected criteria'
      end
    else
      @flights = Flight.none
    end
  end

  def index
    @airports = Airport.all.order(name: :asc)

    # if search parameters are present, perform the search
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:date].present? && params[:passengers].present?
      @departure_airport = Airport.find(params[:departure_airport_id])
      @arrival_airport = Airport.find(params[:arrival_airport_id])
      @date = Date.parse(params[:date])
      @passengers = params[:passengers].to_i

      @flights = Flight.where(departure_airport: @departure_airport, arrival_airport: @arrival_airport, start_datetime: @date.beginning_of_day..@date.end_of_day)

      if @flights.none?
        flash.now[:alert] = 'No flights found for selected criteria'
      end
    else
      @flights = Flight.none
    end

  end
end