require 'spec_helper'

describe "claims/new.html.erb" do
  before(:each) do
    assign(:claim, stub_model(Claim,
      :claim_type => "",
      :active => "",
      :claim_location_postcode => "",
      :cost => "",
      :date_of_loss => ""
    ).as_new_record)
  end

  it "renders new claim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => claims_path, :method => "post" do
      assert_select "input#claim_claim_type", :name => "claim[claim_type]"
      assert_select "input#claim_active", :name => "claim[active]"
      assert_select "input#claim_claim_location_postcode", :name => "claim[claim_location_postcode]"
      assert_select "input#claim_cost", :name => "claim[cost]"
      assert_select "input#claim_date_of_loss", :name => "claim[date_of_loss]"
    end
  end
end
