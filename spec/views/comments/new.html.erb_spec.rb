require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper

  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :content => "value for content",
      :member_id => 1,
      :user_id => 1,
      :share => "value for share"
    )
  end

  it "renders new comment form" do
    render

    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("textarea#comment_content[name=?]", "comment[content]")
      with_tag("input#comment_member_id[name=?]", "comment[member_id]")
      with_tag("input#comment_user_id[name=?]", "comment[user_id]")
      with_tag("input#comment_share[name=?]", "comment[share]")
    end
  end
end
