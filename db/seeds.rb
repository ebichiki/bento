# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
items = [
  {
    name: 'お子様御膳',
    price: 500
  },
  {
    name: 'お子様弁当',
    price: 400
  },
  {
    name: 'キッズプレート',
    price: 300
  }
]

Item.create!(
  items
)

User.create!(
  [
    {
      email: 'test@bento.com',
      password: 'bento0141'
    }
  ]
)

now = Time.current

(now.beginning_of_month.to_date..now.end_of_month.to_date).each do |days|
  Item.all.each do |item|
    Order.create!(
      [
        {
          date: days,
          number: item.id + days.day,
          item_id: item.id,
          user_id: 1
        }
      ]
    )
  end
end
