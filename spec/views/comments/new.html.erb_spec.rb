require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :body => "MyText",
      :author => "MyString",
      :product => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_author[name=?]", "comment[author]"

      assert_select "input#comment_product_id[name=?]", "comment[product_id]"
    end
  end
end
