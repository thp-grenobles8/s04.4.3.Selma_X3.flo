class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :join_table_private_message_users
  has_many :recipients, class_name: "User", through: :join_table_private_message_users
end
