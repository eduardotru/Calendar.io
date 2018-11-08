class CreateJoinTableFriends < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :users do |t|
      t.index [:user_one_id, :user_sent_id]
      t.index [:user_sent_id, :user_req_id]
    end
  end
end
