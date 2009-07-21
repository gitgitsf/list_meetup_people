class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :company
      t.string :title
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
