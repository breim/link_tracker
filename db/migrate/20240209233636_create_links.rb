class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url
      t.string :token
      t.integer :analytics_count, default: 0

      t.timestamps
    end
  end
end
