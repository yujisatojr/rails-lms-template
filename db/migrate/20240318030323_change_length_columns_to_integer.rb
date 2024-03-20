class ChangeLengthColumnsToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :chapters, :length, :integer
    change_column :courses, :length, :integer
  end
end
