class AddCommentTimeAtToFeeds < ActiveRecord::Migration[5.0]
  def change
      add_column :feeds,:commented_at,:datetime
  end
end
