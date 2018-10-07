class StaticPagesController < ApplicationController
  def home
      store_location
      if current_user
          @feeds = current_user.feeds.paginate(page: params[:page])
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
      redirect_to root_path
  end

  def light_type
    #   cookies.permanent[:notetype] = "light"
    session[:notetype] = "light"
      redirect_to root_path
  end

  def life_type
    #   cookies.permanent[:notetype] = "life"
      session[:notetype] = "life"
      redirect_to root_path
  end

  def emotion_type
    #   cookies.permanent[:notetype] = "emotion"
      session[:notetype] = "emotion"
      redirect_to root_path
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
