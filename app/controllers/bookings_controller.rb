class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    begin
     if(!session[:user])
      raise "NO_ACCESS"
    end
      @bookings = User.find(session[:user]["id"]).bookings
     rescue
      render "error"
    else
    end

   end

   def allrooms
    begin
      if(session[:user]["admin"])
      @bookings = Booking.all
      @users = User.all
    else
      raise "NO_ACCESS"
    end
    rescue
      render "error"
    else
    end
   end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  def bookForUser
    begin
    if(session[:user]["admin"])
    @users = User.all
  else
    raise "NO_ACCESS"
  end
  rescue
  render "error"
  else
end
  end

  def createbookingfor
    if(session[:user]["admin"])
      @user_id=params[:user_id]
      searchWithUser(@user_id)
    else
      render "error"
    end
  end


  def history
    @users = User.all
    @room_number = params[:room_number]
    @bookings = Booking.where(room_number: @room_number)
    @prev=[]
    @upcoming=[]
    @bookings.each do |b|
      if(b.datetime<=DateTime.now.to_date)
        @prev.push(b)
      else
        @upcoming.push(b)
      end
    end
    puts @prev 
    puts "--"
    puts @upcoming
  end


    def searchWithUser(id)
    @user_id=id
    @booking = Booking.new
    @rooms = Room.all
    @f = Booking.new
    render "search"
  end



  def search
    @user_id=session[:user]["id"]
    @booking = Booking.new
    @rooms = Room.all
    @f = Booking.new
  end

    def find
    @user_id = params[:user_id]
    @size = params[:size]
    @building = params[:building]
    @datetime=DateTime.new(params['date']['year'].to_i,
			   params['date']['month'].to_i,
			   params['date']['day'].to_i,
			   params['date']['hour'].to_i,
			   params['date']['minute'].to_i)
    @adjusted_datetime = @datetime + 3600
    @size = @size+ " seats"
    @roomsMatchBS=Room.where(size: @size, building: @building)
     ##and (!session[:user]["admin"])
    @BookingsForThatDay = Booking.where("datetime <= ? and datetime >= ?",@adjusted_datetime, @datetime)
    puts Booking.where("user_id= ? and datetime <= ? and datetime >= ?",@user_id, @datetime.to_datetime+2/24.0, @datetime.to_datetime-2/24.0).first
    if((Booking.where("user_id= ? and datetime <= ? and datetime >= ?",@user_id, @datetime.to_datetime+(2/24.0), @datetime.to_datetime-(2/24.0))).any?)
      render "error"
    else
    @temp=[]
    Booking.all.each do |b|
      @incrementedTime = b.datetime.to_datetime+2/24.0
      puts "Initial: "+b.datetime.strftime("%H:%M")
      puts "Later:"+@incrementedTime.strftime("%H:%M")
      puts "-------1"
      if (b.datetime.to_datetime-(2/24.0))<=@datetime 
        if @incrementedTime>=@datetime 
          @temp.push(b)
        end
      end
    end
    @BookingsForThatDay=@temp
    @commonRooms=[]
    @roomsMatchBS.each do |r|
      @BookingsForThatDay.each do |b|
        if(r.room_number==b.room_number)
          @commonRooms.push(r)
        end
      end
    end

    @commonRooms = @commonRooms.uniq
    @roomnumbers=[]
    @commonRooms.each do |r|
      @roomnumbers.push(r.room_number)
    end

    @uncommon=@roomsMatchBS.where.not(room_number:@roomnumbers)


    render "find"
  end
  end

  # GET /bookings/new
  def new
    @user_id=session[:user]["id"]
    @booking = Booking.new
    @rooms = Room.all
  end

  # GET /bookings/1/edit
  def edit
    begin
    if(session[:user])
      @user_id=session[:user]["id"]
      @rooms = Room.all
    else
      raise "NO_ACCESS"
   end
  rescue
    render "error"
  else
    end

  end

  def newBooking
    @user_id = params[:user_id]
    @datetime = params[:datetime].to_datetime
    @room_number = params[:room_number]
    @booking = Booking.create(user_id: @user_id, datetime: @datetime, room_number: @room_number)
    if@booking.save
      render "success"
    else
      render "error"
    end

    
  end


  # POST /bookings
  # POST /bookings.json
  def create
    @user_id = params[:user_id]
    @room_number = params[:room_number]
    @booking = Booking.new(booking_params)
    @booking.user_id = @user_id
    @booking.room_number=@room_number

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end



  def loggedin

    begin
          if(session[:user])
      return
    else
      raise "NO_ACESS"
    end
    rescue
    else
    end

  end




  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    if (loggedin)
    @user_id = params[:user_id]
    @room_number = params[:room_number]
    @booking.user_id = @user_id
    @booking.room_number=@room_number
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:room_number, :user_id, :datetime)
    end
end
