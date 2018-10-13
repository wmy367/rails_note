module FeedsHelper

    def sc_c_date(item)
        t =item.created_at
        "#{t.year}年#{t.month}月#{t.day}日#{t.hour}时#{t.min}分"
    end

    def sc_u_date(item)
        t =item.updated_at
        "#{t.year}年#{t.month}月#{t.day}日#{t.hour}时#{t.min}分"
    end

    def sc_uoc_date(item)
        if item.commented_at
            t = item.commented_at
        else
            t =item.updated_at
        end
        "#{t.year}年#{t.month}月#{t.day}日#{t.hour}时#{t.min}分"
    end

    def notetype_color(feed=nil)
        unless feed
            # ca = cookies[:notetype]
            ca = session[:notetype]
        else
            ca = feed.notetype.to_s
        end
        case ca
        when 'health'
            "##{200.to_s(16)}#{238.to_s(16)}#{200.to_s(16)}"
        when 'light'
            "##{238.to_s(16)}#{238.to_s(16)}#{200.to_s(16)}"
        when 'life'
            "##{238.to_s(16)}#{200.to_s(16)}#{200.to_s(16)}"
        when 'emotion'
            "##{200.to_s(16)}#{200.to_s(16)}#{238.to_s(16)}"
        else
            "##{200.to_s(16)}#{200.to_s(16)}#{200.to_s(16)}"
        end
    end

    def submit_notetype
        # case cookies[:notetype]
        case session[:notetype]
        when 'health'
            "健康"
        when 'light'
            "点子"
        when 'life'
            "生活"
        when 'emotion'
            "情感"
        else
            "其他"
        end
    end

    def submit_notetype_btn_color(feed=nil)
        # case cookies[:notetype]
        unless feed
            ty = session[:notetype]
        else
            ty = feed.notetype
        end

        case ty
        when 'health'
            "btn-success"
        when 'light'
            "btn-warning"
        when 'life'
            "btn-danger"
        when 'emotion'
            "btn-info"
        else
            "btn-primary"
        end
    end
end
