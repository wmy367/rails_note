module ApplicationHelper

    def full_title(sub_title)
        base_title = "日志"

        if sub_title.empty?
            base_title
        else
            base_title + "||" + sub_title.to_s
        end
    end
end
