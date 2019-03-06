require 'rails_helper'

RSpec.describe MonthlyOrdersHelper, type: :helper do
  describe 'edit_month' do
    it { expect(edit_month('201902')).to eq('2019-02') }
  end
end
