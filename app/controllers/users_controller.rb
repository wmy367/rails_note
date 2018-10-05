class UsersController < ApplicationController

    # def index
    #     @users = User.paginate(page: params[:page])
    # end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        # render 'static_pages/home'
        @user = User.new(user_params)
        if @user.save
            redirect_to action: :show,notice: "创建成功"
        else
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
