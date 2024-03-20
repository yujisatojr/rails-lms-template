class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :body
      t.string :tag
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
