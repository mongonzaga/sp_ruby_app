class CreateWebpages < ActiveRecord::Migration[7.0]
  def change
    create_table :webpages do |t|
      t.string :page_name

      t.timestamps
    end
  end
end
