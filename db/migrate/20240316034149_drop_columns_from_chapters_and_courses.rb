class DropColumnsFromChaptersAndCourses < ActiveRecord::Migration[6.0]
  def change
    # Drop columns from the 'chapters' table
    remove_column :chapters, :video_link
    remove_column :chapters, :attachment
    remove_column :chapters, :hasVideo

    # Drop columns from the 'courses' table
    remove_column :courses, :author_img
    remove_column :courses, :img_link
    remove_column :courses, :job_type
    remove_column :courses, :learning_outcome
  end
end
