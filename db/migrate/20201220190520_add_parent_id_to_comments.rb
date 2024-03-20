class AddParentIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :parent_id, :integer
  end
end
