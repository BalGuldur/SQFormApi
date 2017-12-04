class Rule < ApplicationRecord
  belongs_to :game
  has_many :coefficient_time_ranges, dependent: :destroy
  has_many :coefficient_tables, through: :coefficient_time_ranges

  # Выгрузка coefficient tables только для конкретной коллекции rules
  def self.coefficient_tables
    CoefficientTable.joins(:rules).where(rules: { id: ids }).distinct
  end

  # Выгрузка coefficient time range только для конкретной коллекции rules
  def self.coefficient_time_ranges
    CoefficientTimeRange.joins(:rule).where(rules: { id: ids }).distinct
  end

  # Изменение дочерних coefficient_time_ranges
  def change_coeff_time_ranges items_params
    # Для каждого coefficient time range в параметрах
    unless items_params.blank?
      items_params.each do |key, coeff_time_range|
        # Если key < 0 создать coefficient time range
        if key.to_i < 0
          item = coeff_time_range.as_json
          coefficient_time_ranges << CoefficientTimeRange.new_from_params(item)
        elsif key.to_i > 0
          # TODO: Сделать редактирование coefficient time range
        end
      end
    end
  end

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
