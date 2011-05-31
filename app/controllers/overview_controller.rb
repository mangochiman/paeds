class OverviewController < ApplicationController
    before_filter:authorize
    layout'edit'
    def patient
      @title="Overview of patients"
      @patient=Patient.find(:all)
      
    end

    def treatment
      @title="Overview of Treatments"
      @treatment=Treatment.find(:all)
    end

    def referral
      @title="Overview of Referrals"
      @referral= Referral.find(:all)
    end
    def combination
      @title="Summary"
      @patients_overview = Patient.count
      @patients_treatment = Treatment.count
      @patients_referral = Referral.count
      @patients_discharge =Discharge .count
      
    end
    def blank_page
      @title="Patient Overview"
    end
    
    def more_details
     @title="Patients On Treatment"
     @patients = Patient.find(:all, :joins =>[:treatments])
     @patients_count=@patients.count
     render :layout => "more_details"
    end
    def more_details_blank
     @title="See more"
     render :layout => "reports"
    end
    def without_treatment
     
     @title="Patients Without Treatment"
     @patients_join=Patient.find(:all, :joins=>[:treatments])
     @subtract= @patients_join.count
     @patients=Patient.find(:all).collect{|patient| patient if patient.treatments.empty?}.compact
     @count=@patients.count
     @diff=@count-@subtract
     render :layout => "more_details"
    end
    def no_treatment
     
     @title="Patients Without Treatment"
     @patients_join=Patient.find(:all, :joins=>[:treatments])
     @subtract= @patients_join.count
     @patients=Patient.find(:all).collect{|patient| patient if patient.treatments.empty?}.compact
     @count=@patients.count
     @diff=@count-@subtract
     respond_to do |format|
     format.pdf { render :layout => false }
     end
    end
    
    def with_treatment
     @title="Patients On Treatment"
     @patients = Patient.find(:all, :joins =>[:treatments])
     @patients_count=@patients.count
     respond_to do |format|
     format.pdf { render :layout => false }
     end   
    end

    def discharged
     @title="Discharged Patients"
     @patients=Patient.find(:all,:joins => [:discharges])
     @patients_count=@patients.count
     render :layout => "more_details"
    
    end
    def gone_home
     @title="Discharged Patients"
     @patients=Patient.find(:all,:joins => [:discharges])
     @patients_count=@patients.count
     respond_to do |format|
     format.pdf { render :layout => false }
     end
    end
    def referred
     @title="Referred Patients"
     @patients=Patient.find(:all,:joins => [:referrals])
     @patients_count=@patients.count
     render :layout => "more_details"
    end
    def transfered_patients
     @title="Referred Patients"
     @patients=Patient.find(:all,:joins => [:referrals])
     @patients_count=@patients.count
     respond_to do |format|
     format.pdf { render :layout => false }
     end
    end
    def graph
    
    @title="MONTHLY ADMISSION"
    @january=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'01']).count.to_i
    @february=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'02']).count.to_i
    @march=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'03']).count.to_i
    @april=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'04']).count.to_i
    @may=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'05']).count.to_i
    @june=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'06']).count.to_i
    @july=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'07']).count.to_i
    @august=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'08']).count.to_i
    @september=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'09']).count.to_i
    @october=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'10']).count.to_i
    @november=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'11']).count.to_i
    @december=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'12']).count.to_i
 
    render :layout=>"graph_reports"
    end
    def graph_reports_blank
    @title="Graph Reports"
    render :layout=>"graph_reports"
    end
    
    def graph_menu_blank
    @title="Graph Reports"
    render :layout=>"graph_menu"
    end
    
    def admission_pie
    
    end
    
    def admission_bar
    @title="Bar Chart"
    @january=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'01']).count.to_i
    @february=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'02']).count.to_i
    @march=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'03']).count.to_i
    @april=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'04']).count.to_i
    @may=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'05']).count.to_i
    @june=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'06']).count.to_i
    @july=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'07']).count.to_i
    @august=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'08']).count.to_i
    @september=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'09']).count.to_i
    @october=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'10']).count.to_i
    @november=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'11']).count.to_i
    @december=Patient.find(:all,:conditions =>["DATE_FORMAT(date_admitted,'%m')=?",'12']).count.to_i
    render :layout=>"graph_reports"
    end

    def referral_line_chart
    @title="Referral Line Chart"
    @january=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'01']).count.to_i
    @february=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'02']).count.to_i
    @march=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'03']).count.to_i
    @april=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'04']).count.to_i
    @may=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'05']).count.to_i
    @june=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'06']).count.to_i
    @july=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'07']).count.to_i
    @august=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'08']).count.to_i
    @september=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'09']).count.to_i
    @october=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'10']).count.to_i
    @november=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'11']).count.to_i
    @december=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'12']).count.to_i
    render :layout=>"referral_charts"
    end

    def referral_bar_chart
     @title="Referral Bar Chart"
    @january=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'01']).count.to_i
    @february=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'02']).count.to_i
    @march=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'03']).count.to_i
    @april=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'04']).count.to_i
    @may=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'05']).count.to_i
    @june=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'06']).count.to_i
    @july=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'07']).count.to_i
    @august=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'08']).count.to_i
    @september=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'09']).count.to_i
    @october=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'10']).count.to_i
    @november=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'11']).count.to_i
    @december=Referral.find(:all,:conditions =>["DATE_FORMAT(date_referred,'%m')=?",'12']).count.to_i
    render :layout=>"referral_charts"
    end

    def referral_chart_blank
    @title="Referral Charts"
    render :layout => "referral_charts"
    end

    def discharge_line_chart
    @title="Discharge Line Chart"
    @january=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'01']).count.to_i
    @february=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'02']).count.to_i
    @march=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'03']).count.to_i
    @april=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'04']).count.to_i
    @may=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'05']).count.to_i
    @june=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'06']).count.to_i
    @july=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'07']).count.to_i
    @august=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'08']).count.to_i
    @september=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'09']).count.to_i
    @october=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'10']).count.to_i
    @november=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'11']).count.to_i
    @december=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'12']).count.to_i
    render :layout => "discharge_charts"
    end

    def discharge_bar_chart
    @title="Discharge Bar Chart"
    @january=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'01']).count.to_i
    @february=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'02']).count.to_i
    @march=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'03']).count.to_i
    @april=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'04']).count.to_i
    @may=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'05']).count.to_i
    @june=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'06']).count.to_i
    @july=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'07']).count.to_i
    @august=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'08']).count.to_i
    @september=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'09']).count.to_i
    @october=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'10']).count.to_i
    @november=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'11']).count.to_i
    @december=Discharge.find(:all,:conditions =>["DATE_FORMAT(date_discharged,'%m')=?",'12']).count.to_i
    render :layout => "discharge_charts"
    end

    def discharge_chart_blank
    @title="Discharge Reports"
    render :layout => "discharge_charts"
    end
end









