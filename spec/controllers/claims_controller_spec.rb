require 'spec_helper'

describe ClaimsController do

  def valid_attributes
    {claim_type: "Motor", active: true, claim_location_postcode: "N1 6ND", customer_name: "David Smith", customer_postcode: "EC1 5AR", customer_phone: "07515355323", cost: 2476.64, date_of_loss: Time.now}
  end

  describe "GET index" do
    it "assigns all claims as @claims" do
      Claim.stub(:all).and_return([1,2,3])
      get :index
      assigns(:claims).should eq([1,2,3])
    end
  end

  describe "GET show" do
    it "assigns the requested claim as @claim" do
      claim = stub_model(Claim)
      Claim.stub(:find).and_return(claim)
      get :show, :id => claim.id.to_s
      assigns(:claim).should eq(claim)
    end
  end

  describe "GET new" do
    it "assigns a new claim as @claim" do
      get :new
      assigns(:claim).should be_a_new(Claim)
    end
  end

  describe "GET edit" do
    it "assigns the requested claim as @claim" do
      claim = stub_model(Claim)
      Claim.stub(:find).and_return(claim)
      get :edit, :id => claim.id.to_s
      assigns(:claim).should eq(claim)
    end
  end

  describe "POST create" do

    it "assigns a newly created claim as @claim" do
      Claim.any_instance.stub(:save).and_return(true)
      post :create, :claim => {}
      assigns(:claim).should be_a(Claim)
    end

    it "redirects to the created claim" do
      claim = stub_model(Claim, :save => true)
      Claim.stub(:new).and_return(claim)
      post :create, :claim => {}
      response.should redirect_to(claim)
    end

  end

    describe "with invalid params" do

      it "assigns a newly created but unsaved claim as @claim" do
        # Trigger the behavior that occurs when invalid params are submitted
        Claim.any_instance.stub(:save).and_return(false)
        post :create, :claim => {}
        assigns(:claim).should be_a_new(Claim)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Claim.any_instance.stub(:save).and_return(false)
        post :create, :claim => {}
        response.should render_template("new")
      end
    end

  describe "PUT update" do

    describe "with valid params" do

      let(:claim) {stub_model(Claim)}

      before(:each) do
        Claim.stub(:find).and_return(claim)
      end

      it "updates the requested claim" do
        Claim.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => claim.id, :claim => {'these' => 'params'}
      end

      it "assigns the requested claim as @claim" do
        put :update, :id => claim.id, :claim => valid_attributes
        assigns(:claim).should eq(claim)
      end

      it "redirects to the claim" do
        put :update, :id => claim.id, :claim => valid_attributes
        response.should redirect_to(claim)
      end
    end

    describe "with invalid params" do
      let(:claim) { stub_model(Claim, :save => false) }
      before(:each) do
        Claim.stub(:find).and_return(claim)
      end
      it "assigns the claim as @claim" do
        put :update, :id => "some", :claim => {}
        assigns(:claim).should eq(claim)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => "some", :claim => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested claim" do
      claim = Claim.create! valid_attributes
      expect {
        delete :destroy, :id => claim.id.to_s
      }.to change(Claim, :count).by(-1)
    end

    it "redirects to the claims list" do
      claim = Claim.create! valid_attributes
      delete :destroy, :id => claim.id.to_s
      response.should redirect_to(claims_url)
    end
  end

  describe "searching for claims" do
    before(:each) do
      Claim.stub(:find).and_return([1,2,3])
    end
    it 'assigns all found claims' do
      post :search, :q => 'some' 
      assigns(:claims).should eql([1,2,3])
    end
    it 'renders the index action' do
      post :search, :q => 'some' 
      response.should render_template :index 
    end
  end

end
