class CreateCoefficientTimeRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :coefficient_time_ranges do |t|
      t.references :coefficient_table, foreign_key: true
      t.references :rule, foreign_key: true
      t.daterange :timeRange

      t.timestamps
    end
  end
end
