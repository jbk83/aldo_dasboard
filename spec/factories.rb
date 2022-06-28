FactoryBot.define do
  factory(:store) do
    name { "Test store" }
  end

  factory(:item) do
    name { "Test item" }
  end

  factory(:store_item) do
    inventory { 10 }
    store
    item
  end
end