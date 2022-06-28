require 'rails_helper'

describe UndefinedAdapter do
  let(:store) { create(:store) }
  let(:item) { create(:item) }
  let(:message) { nil }

  subject { described_class.new(message) }

  context 'when providing sale message' do
    it 'always match to the adapter' do 
      expect(subject.match?).to be(true)
    end
  end

  context 'when a call is made' do
    it 'return a NotImplementedError' do
      expect { subject.call }.to raise_exception(NotImplementedError)
    end
  end
end