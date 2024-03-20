class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.string :user_name
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
