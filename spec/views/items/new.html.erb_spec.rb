require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :description => "MyText",
      :chargeable => false,
      :user => nil,
      :category => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[chargeable]"

      assert_select "input[name=?]", "item[user_id]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
