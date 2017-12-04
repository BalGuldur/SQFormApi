class RulesController < ApplicationController
  def index
    @rules = Rule.all
    render json: {
      # Возвращаем все правила и дочерние элементы
      rules: @rules.front_view,
      coefficientTables: @rules.coefficient_tables.front_view,
      coefficientTimeRanges: @rules.coefficient_time_ranges.front_view
    }, status: :ok
  end

  def create
    # Создать правило
    @rule = Rule.new rule_params
    # Создать дочерние coefficient time ranges
    @rule.change_coeff_time_ranges coefficient_time_ranges_params
    if @rule.save
      # Если правило удачно сохранено возвращаем правило с дочерними элементами
      render json: {
        rules: { @rule.id => @rule.front_view },
        coefficientTables: @rule.coefficient_tables.front_view,
        coefficientTimeRanges: @rule.coefficient_time_ranges.front_view,
        # Также возвращаем игру, т.к. надо обновить поле rule_ids
        games: { @rule.game_id => @rule.game.front_view }
      }, status: :ok
    else
      # Если объект не сохранен возвращаем ошибки сохранения
      render json: @rule.errors.full_messages, status: 400
    end
  end

  private

  def rule_params
    params.require(:rule).permit(
      :game_id,
      geo: [:condition, values: []],
      devices: [:condition, values: []],
      channels: [:condition, values: []])
  end

  def coefficient_time_ranges_params
    params.permit(coefficientTimeRanges: [
      :coefficient_table_id,
      :timeRange
    ])['coefficientTimeRanges']
  end
end
