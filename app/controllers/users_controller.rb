class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update, :index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  before_filter :already_signed_in,   :only => [:create, :new]

  def new
  	@title="Sign up"
  	@user=User.new
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      flash[:my_own] = "Hey !!!!!! Have a nice day"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end
    
  def update
    @title="Edit User"

    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
      
    else
      flash.now[:error] = "Invalid Inputs"
      @title="Edit user"
      render 'edit'
    end
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 10)
    #@users = User.all
  end

  def destroy

    user=User.find(params[:id])
    if current_user?(user)
      flash[:error] = "Attempt made to delete your own account"
      redirect_to users_path
    else
      user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  

end
