class FeedsController < ApplicationController
    before_action :signed_in_user
    before_action :store_location,only:[:index,:show,:new]

    def new
        session[:float_note_boolen] = "false"
    end


    def create

        fd = Feed.new(feed_params)
        fd.user = current_user
        # fd.notetype = cookies[:notetype]
        fd.notetype = session[:notetype]
        if fd.save
            flash[:notice]  = "日记记录成功"
            # fd.update_attribute(:notetype,cookies[:notetype])
            redirect_to root_path
        else
            flash[:error]   = "日记记录失败"
            render :new
        end
    end

    def feed_params
        params.require(:feed).permit(:type,:context)
    end

    def index
         if current_user
            @feeds = current_user.feeds.paginate(page: params[:page])
            @feeds = @feeds.order(:created_at)
        else
            flash[:notice] = "未登录"
            redirect_to root_path
        end
    end

    def show
        @feed = Feed.find(params[:id])
    end
end
