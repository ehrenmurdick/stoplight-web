class CreateCcUrls < ActiveRecord::Migration
  def change
    create_table :cc_urls do |t|
      t.string :url
      t.integer :user_id
    end
  end
end
