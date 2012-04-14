require 'spec_helper'

describe "incomes/new" do
  before(:each) do
    assign(:income, stub_model(Income,
      :department => nil,
      :supplier => "MyString"
    ).as_new_record)
  end

  it "renders new income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomes_path, :method => "post" do
      assert_select "input#income_department", :name => "income[department]"
      assert_select "input#income_supplier", :name => "income[supplier]"
    end
  end
end
