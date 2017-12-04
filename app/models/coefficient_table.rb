class CoefficientTable < ApplicationRecord
  has_many :coefficient_time_ranges, dependent: :destroy
  has_many :rules, through: :coefficient_time_ranges
  has_many :games, through: :rules

  # Стандартный front_view коллекции в виде {id: {item}, id: {item}}
  def self.front_view
    collect = includes(:coefficient_time_ranges)
    collect.inject({}) do |start, coeff_table|
      start.merge({ coeff_table.id => coeff_table.front_view })
    end
  end

  # Стандартный front_view одного объекта в виде {item}
  def front_view
    json_for_front
  end

  private

  def json_for_front
    as_json(methods: [:coefficient_time_range_ids])
  end
end
