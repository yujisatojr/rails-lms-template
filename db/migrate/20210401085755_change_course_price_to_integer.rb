class ChangeCoursePriceToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :price, :integer
  end
end
