require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Member do
  before(:each) do
    @valid_attributes = {
      :first => "value for first",
      :last => "value for last",
      :email => "value for email",
      :company => "value for company",
      :employed_type => "value for employed_type",
      :gender => "value for gender"
    }
  end

  it "should create a new instance given valid attributes" do
    Member.create!(@valid_attributes)
  end
end
