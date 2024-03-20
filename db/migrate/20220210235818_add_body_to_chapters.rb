class AddBodyToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :body, :string
    add_column :chapters, :attachment, :string
  end
end
