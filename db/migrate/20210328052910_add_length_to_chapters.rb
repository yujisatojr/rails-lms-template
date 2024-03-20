class AddLengthToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :length, :string
    add_column :chapters, :isLocked, :boolean
  end
end
