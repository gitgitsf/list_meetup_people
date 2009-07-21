class RemoveTitleFromMember < ActiveRecord::Migration
  def self.up    
    remove_column :members, :title
  end

  def self.down  
    add_column :members, :title, :string
  end
end
