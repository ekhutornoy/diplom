require 'spec_helper'

describe "sale_orders/new" do
  before(:each) do
    assign(:sale_order, stub_model(SaleOrder,
      :client => "MyString"
    ).as_new_record)
  end

  it "renders new sale_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sale_orders_path, :method => "post" do
      assert_select "input#sale_order_client", :name => "sale_order[client]"
    end
  end
end
