require 'spec_helper'

describe "claims/index.html.erb" do
  before(:each) do
    assign(:claims, [
      stub_model(Claim,
        :claim_type => "",
        :active => "",
        :claim_location_postcode => "",
        :customer_name => "",
        :customer_postcode => "",
        :customer_phone => "",
        :customer_dob => "",
        :cost => "",
        :date_of_loss => ""
      ),
      stub_model(Claim,
        :claim_type => "",
        :active => "",
        :claim_location_postcode => "",
        :customer_name => "",
        :customer_postcode => "",
        :customer_phone => "",
        :customer_dob => "",
        :cost => "",
        :date_of_loss => ""
      )
    ])
  end

  it "renders a list of claims" do
    render
    assert_select "tr", :count => 2 + 1 # header
  end
end
