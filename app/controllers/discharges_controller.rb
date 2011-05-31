class DischargesController < ApplicationController
before_filter:authorize
layout 'operations'
  # GET /discharges
  # GET /discharges.xml
  def index
    @title="Listing Discharges"
    @discharges = Discharge.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @discharges }
    end
  end

  # GET /discharges/1
  # GET /discharges/1.xml
  def show
   @title='Show Discharges'
    @discharge = Discharge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @discharge }
    end
  end

  # GET /discharges/new
  # GET /discharges/new.xml
  def new
    @title='Discharge patient'
    @discharge = Discharge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @discharge }
    end
  end

  # GET /discharges/1/edit
  def edit
    @title='Edit Discharge'
    @discharge = Discharge.find(params[:id])
  end

  # POST /discharges
  # POST /discharges.xml
  def create
    @discharge = Discharge.new(params[:discharge])

    respond_to do |format|
      if @discharge.save
        flash[:notice] = 'Discharge was successfully created.'
        format.html { redirect_to(@discharge) }
        format.xml  { render :xml => @discharge, :status => :created, :location => @discharge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /discharges/1
  # PUT /discharges/1.xml
  def update
    @discharge = Discharge.find(params[:id])

    respond_to do |format|
      if @discharge.update_attributes(params[:discharge])
        flash[:notice] = 'Discharge was successfully updated.'
        format.html { redirect_to(@discharge) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discharge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discharges/1
  # DELETE /discharges/1.xml
  def destroy
    @discharge = Discharge.find(params[:id])
    @discharge.destroy

    respond_to do |format|
      format.html { redirect_to(discharges_url) }
      format.xml  { head :ok }
    end
  end
end
