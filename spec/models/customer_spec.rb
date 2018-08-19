# require 'rails_helper'

# RSpec.describe Customer, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'rails_helper'

RSpec.describe Customer, type: :model do


  describe "#validations" do
    let(:customer) { create :customer }

    subject { customer }

    context "when the customer has the necessary attributes" do
      # in this case we are ensuring everything is included in the order factory
      it { is_expected.to be_valid }
    end

    context "when the customer is missing valid payment" do
      before { customer.update(valid_payment_method: false) }
      # in this case we are ensuring everything is included in the order factory
      it { is_expected.not_to be_valid }
    end

    context "when the customer is missing name" do
      before { customer.update(name: nil) }
      # in this case we are ensuring everything is included in the order factory
      it { is_expected.not_to be_valid }
    end
  end
end
