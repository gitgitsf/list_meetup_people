require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobTitle do
  before(:each) do
    @valid_attributes = {
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    JobTitle.create!(@valid_attributes)
  end
end
