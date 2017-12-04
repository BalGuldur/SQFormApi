class Game < ApplicationRecord
  has_many :rules, dependent: :destroy
  has_many :games, through: :rules
  has_many :coefficient_time_ranges, through: :rules
  has_many :coefficient_tables, through: :coefficient_time_ranges

  # Стандартный front_view коллекции в виде {id: {item}, id: {item}}
  def self.front_view
    collect = includes(:rules)
    collect.inject({}) { |start, game| start.merge({ game.id => game.front_view }) }
  end

  # Стандартный front_view одного объекта в виде {item}
  def front_view
    json_for_front
  end

  private

  def json_for_front
    as_json(methods: [:rule_ids])
  end
end
