class CommentsController < ApplicationController   
   before_filter :authenticate, :only => [:destroy ]      
  
  
  # GET /comments
  # GET /comments.xml
  def index      
    @member = params[:member_id]
    @comments = @member.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    
    @comment.user_id =current_user.id
    @comment.member_id = params[:member_id]   
    @member =Member.find(params[:member_id])   
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'   
          
        # count_member_comments method returns to totals:
         @tot_comments,  @tot_private_comments = count_member_comments(@member)  
         # @total_public = ( @tot_comments - @total_private_comments ).to_i
        # format.html { redirect_to(@comment) }
        format.html { redirect_to(@member) }   #want to reddisplay members/show page
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
        format.js # renders create.js.rjs
      else
        # format.html { render :action => "new" }   
        # how to render to member/show page?
        flash[:error] = 'Please enter your comment'
        format.html { redirect_to(@member) } 
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity } 
        format.js 
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
