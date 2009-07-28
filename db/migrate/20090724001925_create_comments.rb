class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :content
      t.integer :member_id
      t.integer :user_id
      t.string :share

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
