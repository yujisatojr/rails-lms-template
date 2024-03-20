class AddLearningOutcomeToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :learning_outcome, :string
  end
end
