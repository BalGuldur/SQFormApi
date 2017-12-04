require 'test_helper'

class CoefficientTimeRangeTest < ActiveSupport::TestCase
  test 'right work new_from_params on member' do
    # TODO: Проверить исполняемость метода new_from_params с разными параметрами
  end

  test 'front_view work on member' do
    assert(Rule.first.front_view.present?)
  end

  test 'front_view on member return right format' do
    # TODO: Проверить правильность вывода front_view on model Rule
  end

  test 'front_view work on collection' do
    assert(Rule.first.front_view.present?)
  end

  test 'front_view on collect return right format' do
    # TODO: Проверить правильность вывода front_view on collect Rule
  end

  test 'right format json_for_front on member' do
    # TODO: Сделать тест, не забыть что метод приватный - использовать send
  end
end
