class StaticPagesController < ApplicationController
  def home
      store_location
      if current_user
          @feeds = current_user.feeds.order(:commented_at).reverse_order.paginate(page: params[:page])
        #    @feeds = current_user.feeds.order_by do |item|
        #        item.commented_at || item.created_at
        #    end.paginate(page: params[:page])
        feed_assign_commented_at(@feeds)
      else
          flash[:warning] = "请先登陆"
          @feeds = []
      end
  end

  def help
  end

  def about
  end

  def health_type
    #   cookies.permanent[:notetype] = "health"
      session[:notetype] = "health"
      store_location
    #   redirect_to root_path
      @feeds = current_user.feeds.where(notetype: 'health').order(:commented_at).paginate(page: params[:page])
      feed_assign_commented_at(@feeds)
      render :home
  end

  def light_type
    #   cookies.permanent[:notetype] = "light"
      session[:notetype] = "light"
      store_location
      @feeds = current_user.feeds.where(notetype: 'light').order(:commented_at).paginate(page: params[:page])
      feed_assign_commented_at(@feeds)
      render :home
  end

  def life_type
    #   cookies.permanent[:notetype] = "life"
      session[:notetype] = "life"
      store_location
      @feeds = current_user.feeds.where(notetype: 'life').order(:commented_at).paginate(page: params[:page])
      feed_assign_commented_at(@feeds)
      render :home
  end

  def emotion_type
    #   cookies.permanent[:notetype] = "emotion"
      session[:notetype] = "emotion"
      store_location
      @feeds = current_user.feeds.where(notetype: 'emotion').order(:commented_at).paginate(page: params[:page])
      feed_assign_commented_at(@feeds)
      render :home
  end

  def float_note_ctrl
    #   cf = cookies[:float_note_boolen]
      cf = session[:float_note_boolen]
      if cf == "true"
        #   cookies.permanent[:float_note_boolen] = "false"
          session[:float_note_boolen] = "false"
      else
        #   cookies.permanent[:float_note_boolen] = "true"
          session[:float_note_boolen] = "true"
      end
      redirect_back_or root_path
  end

end
