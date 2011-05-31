
class PatientsController < ApplicationController
before_filter:authorize
  # GET /patients
  # GET /patients.xml
  layout 'operations'
  def index
    @title="Listing Patients"
    @patients = Patient.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end
 

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @title='Show patients'
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end
  def menu
  rende:layout => 'edit'
  end
  # GET /patients/new
  # GET /patients/new.xml
  def new
  @title='New admission'
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @title='Edit patients'
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.xml
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        flash[:notice] = 'Patient was successfully created.'
        format.html { redirect_to(@patient) }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:notice] = 'Patient was successfully updated.'
        format.html { redirect_to(@patient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end
  def no_search_term
  end
  def search
  @title="Search Results"
   if params[:search].to_s !=""
   
    @patients=Patient.search params[:search]
    @patients_count=@patients.count
    flash.now[:notice]= "#{@patients_count} results were found"
   else
   flash.now[:notice]='Nothing to search'
   render :layout=>'nothing_to_search',:action =>"no_search_term"
   end
  end
end


