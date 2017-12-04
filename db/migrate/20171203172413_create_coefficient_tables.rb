class CreateCoefficientTables < ActiveRecord::Migration[5.1]
  def change
    create_table :coefficient_tables do |t|
      t.string :title

      t.timestamps
    end
  end
end
