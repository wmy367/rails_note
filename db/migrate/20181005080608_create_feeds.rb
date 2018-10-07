class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
        t.string    :type
        t.text      :context
        t.integer   :user_id
        t.timestamps
    end

    add_index :feeds,:created_at
  end
end
