class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	# GET /users
	# GET /users.json
	def index
		begin
			if(session[:user]["admin"])
				@users = User.where.not(id: 1)
			else
				raise "No_ACCESS"
			end
		rescue
			render "error"
		else
		end
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end

	# GET /users/new
	def new
		@user = User.new
    session[:user] = @user
	end

	# GET /users/login
	def login
    session.clear
		@user = User.new
	end

	# GET /users/1/edit
	def edit


	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		if(User.where(email: @user.email).first)
			render "error"
		else

			respond_to do |format|
				if @user.save
					if session[:user]
						format.html { redirect_to '/logout', notice: '' }
					else
						format.html { redirect_to '/'}
					end
					format.json { render :show, status: :created, location: '/' }
				else
					format.html { render :new }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		begin
			if(session[:user]["id"]!=@user.id and session[:user]["admin"]==false)
				raise "No_ACCESS"
			else
				puts "1"

				puts "3"
				respond_to do |format|
					if @user.update(user_params)
						if(@user.super)
							@user.admin=true
							@user.save
							puts "2"
						end
						format.html { redirect_to @user, notice: 'User was successfully updated.' }
						format.json { render :show, status: :ok, location: @user }
					else
						format.html { render :edit }
						format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				end
			end
		rescue
			render "error"
		else
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		begin
			if(@user.super)
				raise "NO_ACCESS"
			else
				@user.destroy
				respond_to do |format|
					format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
				end
			end
		rescue
			render "error"
		else
		end


	end


	def login
    session.clear
		@email = params[:email]
		@password = params[:password]
		@user = User.find_by_email(@email)
		puts @user
		respond_to do |format|
			if(nil!=@user)
				if(@password == @user.password)
					session[:user] = @user
					session[:exists] = true
					format.html { redirect_to '/bookings'}  
				else
					session.clear
          
					format.html { redirect_to '/error', notice: 'Incorrect login!' }
				end
			else
				session.clear
        
				format.html { redirect_to '/error', notice: 'Invalid user Email!' }
			end  
		end
	end

	def logout
		session.clear
    render "login"
	end
  def error
    render layout: false
  end


	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end
	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :password, :admin, :super, :messages, :unread)
	end
end
