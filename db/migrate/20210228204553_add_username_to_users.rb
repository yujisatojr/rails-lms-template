class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :role, :string
    add_column :users, :gender, :string
    add_column :users, :occupation, :integer, default: 0, null: false
  end
end
