class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.references :game, foreign_key: true
      t.json :geo
      t.json :devices
      t.json :channels

      t.timestamps
    end
  end
end
