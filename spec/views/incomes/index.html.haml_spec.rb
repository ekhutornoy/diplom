require 'spec_helper'

describe "incomes/index" do
  before(:each) do
    assign(:incomes, [
      stub_model(Income,
        :department => nil,
        :supplier => "Supplier"
      ),
      stub_model(Income,
        :department => nil,
        :supplier => "Supplier"
      )
    ])
  end

  it "renders a list of incomes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Supplier".to_s, :count => 2
  end
end
