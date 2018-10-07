module StaticPagesHelper


    def store_location
        session[:return_to] = request.fullpath
    end

    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end

    def float_note_ctrl_word
        # if cookies[:float_note_boolen]=="true"
        if session[:float_note_boolen]=="true"
            "关闭悬浮"
        else
            "打开悬浮"
        end
    end

    def float_note_show?
        # cookies[:float_note_boolen]=="true"
        session[:float_note_boolen]=="true"
    end

end
