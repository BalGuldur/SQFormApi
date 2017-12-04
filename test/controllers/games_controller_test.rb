require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'index' do
    get games_url
    # Тест наличия в выводе нужных коллекций
    assert(json_response.has_key? 'games')
    # TODO: Добавить тестирование соответствия вывода, выводу front_view
  end
end
