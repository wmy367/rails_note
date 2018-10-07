class RemoveTypeToFeeds < ActiveRecord::Migration[5.0]
  def change
      remove_column :feeds,:type
  end
end
