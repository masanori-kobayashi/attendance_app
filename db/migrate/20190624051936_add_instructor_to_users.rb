class AddInstructorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :instructor, :boolean, default: false
  end
end
