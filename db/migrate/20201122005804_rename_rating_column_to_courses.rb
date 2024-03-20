class RenameRatingColumnToCourses < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :rating, :enroll
  end
end
