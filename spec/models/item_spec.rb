require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many(:customer_items)}
    it { should have_many(:customers).through(:customer_items) }
  end
end
