class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :author
      t.string :body
      t.integer :course_id

      t.timestamps
    end
  end
end
