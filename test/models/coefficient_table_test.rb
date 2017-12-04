require 'test_helper'

class CoefficientTableTest < ActiveSupport::TestCase
  test 'front_view work on member' do
    assert(Rule.first.front_view.present?)
  end

  test 'front_view on member return right format' do
    # TODO: Проверить правильность вывода front_view on member
  end

  test 'front_view work on collection' do
    assert(Rule.first.front_view.present?)
  end

  test 'front_view on collect return right format' do
    # TODO: Проверить правильность вывода front_view on collect
  end

  test 'right format json_for_front on member' do
    # TODO: Сделать тест, не забыть что метод приватный - использовать send
  end
end
