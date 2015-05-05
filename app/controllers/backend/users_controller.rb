class Backend::UsersController < Backend::BaseController
  # before_action :find_user, only:[:show, :destroy, :edit, :update]
  # def index
  # 	@users = User.all
  # end

  # def show
  	
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     flash[:success] = "Welcome to the Sample App!"
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  	
  # end

  # def update
  #   if @user.update(user_params)
  #    flash[:success] = "更新成功"
  #    redirect_to backend_users_path
  #  else
  #    flash[:success] = "problem!"
  #    render :edit
  #  end
  # end

  # def destroy
  # 	@user.destroy

  # 	redirect_to backend_users_path
  # end

   private

    def collection_scope
      User
    end
    def object_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  	# def find_user
  	# 	@user = User.find(params[:id])
  	# end

  	# def user_params
   #  params.require(:user).permit(:name, :email, :password,
   #                                 :password_confirmation)
  	# end

end
