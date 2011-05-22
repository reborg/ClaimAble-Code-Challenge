require 'spec_helper'

describe "Claims" do

  describe "GET /claims" do

    it "should show the search results" do
      post search_path, :search => "N1 WDEF"
      response.status.should be(200)
    end

  end

end
