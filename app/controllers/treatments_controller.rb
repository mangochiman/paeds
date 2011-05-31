class TreatmentsController < ApplicationController
before_filter:authorize
layout 'operations'
  # GET /treatments
  # GET /treatments.xml
  def index
    @title="Listing Treatments"
    @treatments = Treatment.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @treatments }
    end
  end

  # GET /treatments/1
  # GET /treatments/1.xml
  def show
    @title='Show treatment'
    @treatment = Treatment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @treatment }
    end
  end

  # GET /treatments/new
  # GET /treatments/new.xml
  def new
    @title='New treatment'
    @treatment = Treatment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @treatment }
    end
  end

  # GET /treatments/1/edit
  def edit
    @title='Edit treatment'
    @treatment = Treatment.find(params[:id])
  end

  # POST /treatments
  # POST /treatments.xml
  def create
    @treatment = Treatment.new(params[:treatment])

    respond_to do |format|
      if @treatment.save
        flash[:notice] = 'Treatment was successfully created.'
        format.html { redirect_to(@treatment) }
        format.xml  { render :xml => @treatment, :status => :created, :location => @treatment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @treatment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /treatments/1
  # PUT /treatments/1.xml
  def update
    @treatment = Treatment.find(params[:id])

    respond_to do |format|
      if @treatment.update_attributes(params[:treatment])
        flash[:notice] = 'Treatment was successfully updated.'
        format.html { redirect_to(@treatment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @treatment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.xml
  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy

    respond_to do |format|
      format.html { redirect_to(treatments_url) }
      format.xml  { head :ok }
    end
  end
end
