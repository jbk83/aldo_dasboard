class UndefinedAdapter < BaseAdapter
  def match?
    true
  end

  #TODO: manage error
  def call(*)
    fail NotImplementedError
  end
end