class AddJobTitleIdToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :job_title_id, :integer
  end

  def self.down
    remove_column :members, :job_title_id
  end
end
