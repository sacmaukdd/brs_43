class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.string :action_name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :requests, [:user_id, :created_at]
  end
end
