class AddUniqToToken < ActiveRecord::Migration[7.1]
  def change
    add_index :links, :token, unique: true
  end
end
