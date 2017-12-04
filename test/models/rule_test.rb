require 'test_helper'

class RuleTest < ActiveSupport::TestCase
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

  test 'right work coefficient_tables on collection' do
    # TODO: Сделать тест
  end

  test 'right work coefficient_time_ranges on collection' do
    # TODO: Сделать тест
  end

  test 'right work change_coeff_time_ranges on member' do
    # TODO: Сделать тест
  end

  test 'right format json_for_front on member' do
    # TODO: Сделать тест, не забыть что метод приватный - использовать send
  end
end
