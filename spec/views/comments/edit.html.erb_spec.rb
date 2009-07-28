require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper

  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :content => "value for content",
      :member_id => 1,
      :user_id => 1,
      :share => "value for share"
    )
  end

  it "renders the edit comment form" do
    render

    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_content[name=?]', "comment[content]")
      with_tag('input#comment_member_id[name=?]', "comment[member_id]")
      with_tag('input#comment_user_id[name=?]', "comment[user_id]")
      with_tag('input#comment_share[name=?]', "comment[share]")
    end
  end
end
