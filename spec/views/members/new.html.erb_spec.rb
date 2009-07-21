require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/members/new.html.erb" do
  include MembersHelper

  before(:each) do
    assigns[:member] = stub_model(Member,
      :new_record? => true,
      :first => "value for first",
      :last => "value for last",
      :email => "value for email",
      :company => "value for company",
      :employed_type => "value for employed_type",
      :gender => "value for gender"
    )
  end

  it "renders new member form" do
    render

    response.should have_tag("form[action=?][method=post]", members_path) do
      with_tag("input#member_first[name=?]", "member[first]")
      with_tag("input#member_last[name=?]", "member[last]")
      with_tag("input#member_email[name=?]", "member[email]")
      with_tag("input#member_company[name=?]", "member[company]")
      with_tag("input#member_employed_type[name=?]", "member[employed_type]")
      with_tag("input#member_gender[name=?]", "member[gender]")
    end
  end
end
