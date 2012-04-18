require 'spec_helper'

describe "sale_orders/show" do
  before(:each) do
    @sale_order = assign(:sale_order, stub_model(SaleOrder,
      :client => "Client"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client/)
  end
end
