class DashboardController < ApplicationController
  def index
    @store_items = StoreItem.all
    @stores = Store.order(:id).all
    @items = Item.order(:id).all
  end
end
