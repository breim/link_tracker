class RemoveUnsedColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :analytics, :session, :string
    remove_column :links, :short_url, :string
  end
end
