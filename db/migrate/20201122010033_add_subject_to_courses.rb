class AddSubjectToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :subject, :string
  end
end
