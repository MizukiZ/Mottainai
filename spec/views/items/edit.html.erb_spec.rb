require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :description => "MyText",
      :chargeable => false,
      :user => nil,
      :category => nil
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[chargeable]"

      assert_select "input[name=?]", "item[user_id]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
