class BookingsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index]
  before_filter :only => [:show, :update, :destroy], do 
    redirect_to '/' unless current_user && current_user.admin?
  end
  
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    if params[:booking]["name"]
      
      @booking = session[:booking]
      @booking.attribute_names.each do |k|
        if !params[:booking][k].nil?
          @booking[k] = params[:booking][k]
        end
      end
  
      respond_to do |format|
        if @booking.save
          format.html { redirect_to '/bookings', notice: 'Booking was successfully created.' }
          format.json { render json: @booking, status: :created, location: @booking }
        else
          format.html { render action: "new" }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      
      @booking = Booking.new(params[:booking])
      session[:booking] = @booking
      
      respond_to do |format|
        if !@booking.valid? and (@booking.errors[:start_at_time].any? or @booking.errors[:end_at_time].any?)
          params[:booking] = nil
        end
        
        @err = true
        format.html { render action: "new" }
      end
      
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end
end
