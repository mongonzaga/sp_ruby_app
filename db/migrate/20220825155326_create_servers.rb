class CreateServers < ActiveRecord::Migration[7.0]
  def change
    create_table :servers do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
