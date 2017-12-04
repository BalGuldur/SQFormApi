class CoefficientTimeRange < ApplicationRecord
  belongs_to :coefficient_table
  belongs_to :rule
  has_one :game, through: :rule

  # Создание из строки парамтеров с преобразование date range, для поля timeRange
  def self.new_from_params item
    # TODO: Вынести преобразование строк в date range в отдельный класс
    # Делим timeRange по '...', from_date = значение слева, to_date = значение справа
    from_date = item['timeRange'].split('...')[0].to_date
    to_date = item['timeRange'].split('...')[1].to_date
    # TODO: Добавить проверку from_date < to_date и перемена мест дат
    item['timeRange'] = from_date...to_date
    new(item)
  end

  # Стандартный front_view коллекции в виде {id: {item}, id: {item}}
  def self.front_view
    collect = all
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
    as_json()
  end
end
