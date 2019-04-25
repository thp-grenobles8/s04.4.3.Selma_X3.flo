class CreateJoinTableUserGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_user_gossips do |t|

      t.timestamps
    end
  end
end
