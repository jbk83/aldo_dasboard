require 'rails_helper'

describe WsResolver do
  let(:store) { create(:store) }
  let(:item) { create(:item) }
  let(:message) { { store: store.name, model: item.name, inventory: 50 } }


  context 'when providing sale message' do
    it 'return the sale adapter' do 
      expect(subject.resolve(message)).to be_an_instance_of(SaleAdapter)
    end
  end

  context 'when providing incorrect message' do
    let(:message) { { store: store.name, model: item.name } }

    it 'not match to the adapter' do 
      expect(subject.resolve(message)).to be_an_instance_of(UndefinedAdapter)
    end
  end
end