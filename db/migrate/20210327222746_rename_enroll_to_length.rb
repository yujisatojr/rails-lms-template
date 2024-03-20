class RenameEnrollToLength < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :subtitle, :body
    rename_column :courses, :subject, :author_info
    rename_column :courses, :link, :author_img
    rename_column :courses, :enroll, :length
  end
end
