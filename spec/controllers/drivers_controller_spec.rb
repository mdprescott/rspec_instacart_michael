require 'rails_helper'


RSpec.describe DriversController, type: :controller do
  let(:driver) { create :driver }

  describe "#index" do
    it "renders index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "renders show page" do
      get :show, params: { id: driver.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "renders new page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "renders edit page" do
      get :edit, params: { id: driver.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "creates new driver" do
      driver_params = FactoryBot.attributes_for(:driver)
      expect{ post :create, :params => {driver: driver_params} }.to change(Driver, :count).by(1)
      expect(response).to redirect_to(assigns(:driver))
    end
  end

  describe "#update" do
    it "updates driver" do
      put :update, :params => {
        driver: 
        {
          name: "Michael Prescott",
          email: "michael@instacart.com",
          phone: 6501234567,
          drivers_license_number: "D1234567",
          drivers_license_state: "AL",
          vehicle_license_plate: "VANITY",
          background_check_clear: false
        } ,
       id: driver.id }
      driver.reload
      expect(driver.name).to eql "Michael Prescott"
      expect(driver.email).to eql "michael@instacart.com"
      expect(driver.phone).to eql 6501234567
      expect(driver.drivers_license_number).to eql "D1234567"
      expect(driver.drivers_license_state).to eql "AL"
      expect(driver.vehicle_license_plate).to eql "VANITY"
      expect(driver.background_check_clear).to be false
      expect(response).to redirect_to(assigns(:driver))
      end
    end

  describe "#destroy" do
    it "deletes driver" do
      delete :destroy, params: { id: driver.id }
      expect(response).to redirect_to(drivers_url)
    end
  end

end
