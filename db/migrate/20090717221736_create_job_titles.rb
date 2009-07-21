class CreateJobTitles < ActiveRecord::Migration
  def self.up
    create_table :job_titles do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :job_titles
  end
end
