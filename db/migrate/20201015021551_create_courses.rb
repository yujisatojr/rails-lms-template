class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :author
      t.float :rating
      t.float :price
      t.string :desc
      t.string :link
      t.string :img_link

      t.timestamps
    end
  end
end
