class CellChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cell_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
