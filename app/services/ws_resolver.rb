class WsResolver
  ADAPTER_NAMES = %w[
    Sale
    Undefined
  ].freeze

  def resolve(message)
    ADAPTER_NAMES
      .map { |adapter| "#{adapter}Adapter".constantize.new(message) }
      .find { |adapter| adapter.match? }
  end
end