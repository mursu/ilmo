class CreateCourseInstances < ActiveRecord::Migration
  def self.up
    create_table :course_instances do |t|
      t.int :course_id
      t.string :instance_name

      t.timestamps
    end
  end

  def self.down
    drop_table :course_instances
  end
end
