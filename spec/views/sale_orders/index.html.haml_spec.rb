require 'spec_helper'

describe "sale_orders/index" do
  before(:each) do
    assign(:sale_orders, [
      stub_model(SaleOrder,
        :client => "Client"
      ),
      stub_model(SaleOrder,
        :client => "Client"
      )
    ])
  end

  it "renders a list of sale_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client".to_s, :count => 2
  end
end
