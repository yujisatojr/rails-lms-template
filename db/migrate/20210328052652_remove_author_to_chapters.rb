class RemoveAuthorToChapters < ActiveRecord::Migration[6.0]
  def change
    remove_column :chapters, :author
    remove_column :chapters, :body
    remove_column :chapters, :ch_num
  end
end
