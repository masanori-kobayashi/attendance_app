class RenameInstructorColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :instructor, :superior
  end
end
