module Helpers
  def to_bigdecimal(value)
    aux = value.present? ? BigDecimal(value) : 0
  end
end