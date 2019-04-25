class CreateJoinTablePrivateMessageUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_private_message_users do |t|
      t.references :private_message, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
