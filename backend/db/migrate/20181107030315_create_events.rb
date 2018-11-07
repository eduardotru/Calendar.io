class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :duration
      t.datetime :dueDate
      t.boolean :static
      t.integer :owner
      t.integer :user_id

      t.timestamps
    end
  end
end
