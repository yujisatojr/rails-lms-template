class AddDifficultyToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :difficulty, :string
    add_column :courses, :job_type, :string
  end
end
