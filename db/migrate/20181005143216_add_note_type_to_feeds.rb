class AddNoteTypeToFeeds < ActiveRecord::Migration[5.0]
  def change
      add_column :feeds,:notetype,:string
  end
end
