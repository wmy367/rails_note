class SessionsController < ApplicationController

    def new

    end

    def create

        user = User.find_by(email:params[:session][:email].downcase)
        name_case = false
        unless user
            user = User.find_by(name:params[:session][:email])
            name_case = true
        end

        if user
            if user.authenticate(params[:session][:password])
                sign_in user
                flash[:notice] = "登陆成功"
                redirect_to root_path
            else
                flash[:error] = "密码错误"
                render :new
            end
        else
            if name_case
                flash[:error] = "用户名 和 邮箱 错误"
            else
                flash[:error] = "邮箱错误"
            end
            render :new
        end
    end

    def destroy

        flash[:notice] = "退出成功"
        sign_out
        redirect_to root_path

    end
end
