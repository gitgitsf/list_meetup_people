require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :content => "value for content",
      :member_id => 1,
      :user_id => 1,
      :share => "value for share"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ share/)
  end
end
