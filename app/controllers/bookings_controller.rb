class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    puts @booking.inspect
    @passengers_count = params[:passengers_count]
    
  end
  

  def new
    @booking = Booking.new(flight: @flight)
    @passenger_count = params[:passenger_count]
    puts "xxx299. passenger count new #{params}"
  end

  def create
    
    puts "xxx242 submitted #{params}" 
    @booking = Booking.new(booking_params)
    puts booking_params.inspect
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
  

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passengers_count, passengers_attributes: [:name, :email])
  end
  
end