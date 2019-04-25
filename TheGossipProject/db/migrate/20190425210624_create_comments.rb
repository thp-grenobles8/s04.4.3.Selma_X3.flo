class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :author, index: true
      t.belongs_to :gossip, index: true
      t.text :content
      t.timestamps
    end
  end
end
