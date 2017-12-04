require 'test_helper'

class RulesControllerControllerTest < ActionDispatch::IntegrationTest
  test 'index' do
    get rules_url
    # Тест наличия в выводе нужных коллекций
    assert(json_response.has_key? 'rules')
    assert(json_response.has_key? 'coefficientTables')
    assert(json_response.has_key? 'coefficientTimeRanges')
    # TODO: Добавить тестирование соответствия вывода, выводу front_view
  end

  test 'create' do
    post rules_url,
      params: {
        rule: {
          game_id: games(:one).id
        }
      # TODO: Добавить coefficient_time_ranges в test create rules_controller
      }
    # Тест наличия в выводе нужных коллекций
    assert(json_response.has_key? 'games')
    assert(json_response.has_key? 'coefficientTables')
    assert(json_response.has_key? 'coefficientTimeRanges')
    assert(json_response.has_key? 'rules')
    # TODO: Добавить тестирование соответствия вывода, выводу front_view
    # TODO: Добавить тестирование create в случае наличия и отсутствия разных параметров
  end
end
