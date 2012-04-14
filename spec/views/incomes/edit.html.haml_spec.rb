require 'spec_helper'

describe "incomes/edit" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :department => nil,
      :supplier => "MyString"
    ))
  end

  it "renders the edit income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomes_path(@income), :method => "post" do
      assert_select "input#income_department", :name => "income[department]"
      assert_select "input#income_supplier", :name => "income[supplier]"
    end
  end
end
