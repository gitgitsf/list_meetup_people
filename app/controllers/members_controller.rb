class MembersController < ApplicationController   
  require 'digest/sha1'
  before_filter :get_job_titles , :only => [ :new, :create, :edit, :update ]    
  before_filter :authenticated?, :except => [:index ]
  before_filter :authenticate, :only => [:destroy ]
    
  # GET /members
  # GET /members.xml
  def index
    @members = Member.find(:all, :order =>"last, first DESC", :include => [ :job_title])
 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new(:gender => "Male") 
    #:gender =>"Male" - this set radio button of Male button is selected.

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        flash[:notice] = 'Member was successfully created.'
        format.html { redirect_to(@member) }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(@member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end    
  
  def authenticated?
    if !logged_in?
      flash[:notice] = "You must login to do that"
      #redirect_to root_path
      redirect_to members_path   #mt add: show user all topics after login
      false
    end 
  end     
    
   
 protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
     # username == "admin" && password == "bar"
      username == "admin" && (Digest::SHA1.hexdigest(password) == "0583168ad74a1282d2dfe7caacd5859466cdf722")
    end  
  end
  
  private
  def  get_job_titles
    @job_titles = JobTitle.all
  end     
  
end
