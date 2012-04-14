require 'spec_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :department => nil,
      :supplier => "Supplier"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Supplier/)
  end
end
