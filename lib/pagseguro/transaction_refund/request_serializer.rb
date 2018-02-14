module PagSeguro
  class TransactionRefund
    class RequestSerializer
      # The refund that will be serialized.
      attr_reader :refund

      def initialize(refund)
        @refund = refund
      end

      def to_params
        {}.tap do |data|
          data[:transactionCode] = refund.transaction_code
          data[:refundValue] = to_amount(refund.value)
        end.delete_if { |_, value| value.nil? }
      end

      private

      def to_amount(amount)
        "%.2f" % to_bigdecimal(amount.to_s).round(2) if amount
      end

      def to_bigdecimal(value)
        BigDecimal(value)
      rescue Exception => e
        0
      end     
    end
  end
end
