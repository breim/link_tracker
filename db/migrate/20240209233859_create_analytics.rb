class CreateAnalytics < ActiveRecord::Migration[7.1]
  def change
    create_table :analytics do |t|
      t.string :session
      t.string :system_name
      t.string :browser_name
      t.string :browser_version
      t.string :referer
      t.string :ip
      t.string :device
      t.string :city
      t.string :country
      t.string :region
      t.string :latitude
      t.string :longitude
      t.belongs_to :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
