require 'rails_helper'

RSpec.describe MonthlyOrdersHelper, type: :helper do
  describe "editMonth" do
    it { expect(editMonth('201902')).to eq('2019-02') }
  end
end
