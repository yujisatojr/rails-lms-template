class DropColumnsFromCourses < ActiveRecord::Migration[6.0]
  def change
     # Drop columns from the 'courses' table
     remove_column :courses, :price
     remove_column :courses, :subject

     # Drop columns from the 'chapters' table
     remove_column :chapters, :isLocked

     # Drop columns from the 'articles' table
     remove_column :articles, :tag
  end
end
