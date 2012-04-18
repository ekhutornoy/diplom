require 'spec_helper'

describe "sale_orders/edit" do
  before(:each) do
    @sale_order = assign(:sale_order, stub_model(SaleOrder,
      :client => "MyString"
    ))
  end

  it "renders the edit sale_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sale_orders_path(@sale_order), :method => "post" do
      assert_select "input#sale_order_client", :name => "sale_order[client]"
    end
  end
end
