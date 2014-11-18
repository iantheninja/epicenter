describe BalancedEvent do
  let(:payment_uri) { "/debits/WD3b6phETOvHyNaZtQ5a7zUs" }

  before(:each) do
    @payment = FactoryGirl.create(:payment)
    @payment.update(payment_uri: payment_uri)
  end

  describe 'payment succeeded', :vcr do
    it "updates the payment status to succeeded" do
      balanced = BalancedEvent.new(balanced_callback_debit_succeeded_json(payment_uri))
      @payment.reload
      expect(@payment.status).to eq "succeeded"
    end
  end

  describe 'payment failed', :vcr do
    it "updates the payment status to failed" do
      balanced = BalancedEvent.new(balanced_callback_debit_failed_json(payment_uri))
      @payment.reload
      expect(@payment.status).to eq "failed"
    end
  end
end
