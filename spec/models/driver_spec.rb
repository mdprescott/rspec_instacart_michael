require 'rails_helper'

RSpec.describe Driver, type: :model do

  describe "#validations" do
    let(:driver) { create :driver }

    subject { driver }

    context "when the driver is missing name" do
      before { driver.update(name: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is missing email" do
      before { driver.update(email: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is missing phone" do
      before { driver.update(phone: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is missing drivers licence number" do
      before { driver.update(drivers_license_number: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is missing drivers licence state" do
      before { driver.update(drivers_license_state: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is licence plate" do
      before { driver.update(vehicle_license_plate: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver is missing background_check_clear" do
      before { driver.update(background_check_clear: nil) }
      it { is_expected.not_to be_valid }
    end

    context "when the driver's background check hasn't cleared" do
      before { driver.update(background_check_clear: false) }
      it { is_expected.to be_valid }
    end

    context "when the driver has all the necessary attributes" do
      it { is_expected.to be_valid }
    end
  end
end
