class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.belongs_to :webpage, null: false, foreign_key: true
      t.belongs_to :server, null: false, foreign_key: true

      t.timestamps
    end
  end
end
