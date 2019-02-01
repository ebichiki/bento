# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create!(
  [
    {
      name: 'お子様御膳',
      price: 500,
    },
    {
      name: 'お子様弁当',
      price: 400,
    },
    {
      name: 'キッズプレート',
      price: 300,
    }
  ]
)

User.create!(
  [
    {
      email: 'test@bento.com',
      password: '$2a$11$NiT35Lc3cxLxN4gEvMGV.ufYP390R5bi7ZklB.XhQdHY0rCYPvcWS',
    }
  ]
)


Order.create!(
  [
    {
      date: '2019-3-1',
      number: 1,
      item_id: 2,
      user_id: 1,
    }
  ]
)
