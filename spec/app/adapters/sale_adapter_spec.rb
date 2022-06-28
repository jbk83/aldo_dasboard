require 'rails_helper'

describe SaleAdapter do
  let(:store) { create(:store) }
  let(:item) { create(:item) }
  let(:message) { { store: store.name, model: item.name, inventory: 50 } }

  subject { described_class.new(message) }

  context 'when providing sale message' do
    it 'match to the adapter' do 
      expect(subject.match?).to be(true)
    end
  end

  context 'when providing incorrect message' do
    let(:message) { { store: store.name, model: item.name } }

    subject { described_class.new(message) }

    it 'not match to the adapter' do 
      expect(subject.match?).to be(false)
    end
  end

  context 'when there is no store item' do
    it 'create a store item' do
      expect { subject.call }.to change { StoreItem.count }.by(1)
    end
  end

  context 'when store item exist' do
    let(:store_item) { create(:store_item, store: store, item: item) }

    before do
      store_item
      subject.call
    end

    it 'update the inventory' do
      expect(store_item.reload.inventory).to eq(50)
    end
  end
end