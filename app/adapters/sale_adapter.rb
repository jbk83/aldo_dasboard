class SaleAdapter < BaseAdapter
  def match?
    @message[:store].present? && @message[:model].present? && @message[:inventory].present?
  end

  def call
    store_name = @message[:store]
    item_name = @message[:model]
    inventory = @message[:inventory]

    store = Store.find_by(name: store_name)
    item = Item.find_by(name: item_name)
    store_item = StoreItem.joins(:store, :item).where(store: store, item: item).first

    if store_item
      store_item.update!(inventory: inventory)
    else
      store_item = StoreItem.create!(store: store, item: item, inventory: inventory)
    end
    broadcast_ws(store_item)
  end

  private
  def broadcast_ws(store_item)
    ActionCable.server.broadcast( 
      "cell_channel", 
      { 
        store_id: store_item.store_id, 
        item_id: store_item.item_id, 
        inventory: store_item.inventory
      }
    )
  end
end