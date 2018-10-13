class CommentsController < ApplicationController

    def create
        unless signed_in?
            flash.now[:error] = "请先登陆"
            redirect_to root_path
        end

        @comment = Comment.new(comment_params)
        if @comment.save
            @comment.feed.update_attribute(:commented_at,@comment.created_at)
            flash[:notice]  = "评论成功"
        else
            flash[:error]   = "评论失败"
        end

        # render controller:'feeds',action:'show'
        redirect_to @comment.feed
    end

    def comment_params
        params.require(:comment).permit(:context,:feed_id)
    end

end
