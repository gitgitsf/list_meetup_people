require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobTitlesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "job_titles", :action => "index").should == "/job_titles"
    end

    it "maps #new" do
      route_for(:controller => "job_titles", :action => "new").should == "/job_titles/new"
    end

    it "maps #show" do
      route_for(:controller => "job_titles", :action => "show", :id => "1").should == "/job_titles/1"
    end

    it "maps #edit" do
      route_for(:controller => "job_titles", :action => "edit", :id => "1").should == "/job_titles/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "job_titles", :action => "create").should == {:path => "/job_titles", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "job_titles", :action => "update", :id => "1").should == {:path =>"/job_titles/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "job_titles", :action => "destroy", :id => "1").should == {:path =>"/job_titles/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/job_titles").should == {:controller => "job_titles", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/job_titles/new").should == {:controller => "job_titles", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/job_titles").should == {:controller => "job_titles", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/job_titles/1").should == {:controller => "job_titles", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/job_titles/1/edit").should == {:controller => "job_titles", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/job_titles/1").should == {:controller => "job_titles", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/job_titles/1").should == {:controller => "job_titles", :action => "destroy", :id => "1"}
    end
  end
end
