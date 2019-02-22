require 'rails_helper'

RSpec.describe Item, type: :model do
  # 商品名、金額があれば有効
  it 'is valid with name, price' do
    item = Item.new(
      name: 'のり弁当',
      price: 100
    )
    expect(item).to be_valid
  end
end
