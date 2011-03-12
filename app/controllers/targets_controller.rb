class TargetsController < ApplicationController
  # GET /targets
  # GET /targets.xml
  def index
    @targets = Target.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @targets }
    end
  end

  # GET /targets/1
  # GET /targets/1.xml
  def show
    @target = Target.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # GET /targets/new
  # GET /targets/new.xml
  def new
    @target = Target.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # POST /targets
  # POST /targets.xml
  def create
    @target = Target.new(params[:target])

    respond_to do |format|
      if @target.save
        format.html { redirect_to(@target, :notice => 'Target was successfully created.') }
        format.xml  { render :xml => @target, :status => :created, :location => @target }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @target.errors, :status => :unprocessable_entity }
      end
    end
  end
end
