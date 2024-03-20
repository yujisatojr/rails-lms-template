class AddNumberToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :ch_num, :string
    add_column :users, :img_link, :string
  end
end
