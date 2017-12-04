# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
  when 'development'
    # В development очищаем базу и заносим значения
    Game.destroy_all
    ['IceAge', 'AppJoy'].each {|title| Game.create title: title }
    CoefficientTable.destroy_all
    ['Таблица-1', 'Таблица-2'].each { |title| CoefficientTable.create title: title }
    Rule.destroy_all
    Rule.create(
      game: Game.first,
      geo: { condition: '!=', values: ['US', 'RU'] },
      devices: { condition: '=', values: ['phone'] },
      channels: { condition: '!=', values: ['AppleSource'] }
    )
    Rule.create(
      game: Game.first,
      geo: { condition: '=', values: ['US'] },
      devices: { condition: '=', values: ['tablet'] },
      channels: {}
    )
    CoefficientTimeRange.destroy_all
    CoefficientTimeRange.create(
      rule: Rule.first,
      coefficient_table: CoefficientTable.first,
      timeRange: (DateTime.now-2.day)..(DateTime.now-1.day)
    )
    CoefficientTimeRange.create(
        rule: Rule.first,
        coefficient_table: CoefficientTable.first,
        timeRange: (DateTime.now-3.day)..(DateTime.now-2.day)
    )
    CoefficientTimeRange.create(
        rule: Rule.first,
        coefficient_table: CoefficientTable.second,
        timeRange: (DateTime.now-2.day)..(DateTime.now-1.day)
    )
  when 'test'
  when 'production'
end
