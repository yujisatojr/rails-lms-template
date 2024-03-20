class AddSubTitleToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :subtitle, :string
  end
end
