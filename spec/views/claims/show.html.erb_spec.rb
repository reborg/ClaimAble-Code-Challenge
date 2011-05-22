require 'spec_helper'

describe "claims/show.html.erb" do
  before(:each) do
    customer = stub_model(Customer)
    @claim = assign(:claim, stub_model(Claim,
      :claim_type => "",
      :active => "",
      :claim_location_postcode => "",
      :customers => [customer]*3,
      :cost => "",
      :date_of_loss => ""
    ))
  end

  it "renders customers as a specific section" do
    render
    assert_select "table" do
      assert_select "tr", :count => 3 + 1
    end
  end

end
