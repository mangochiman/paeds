pdf.move_down(30) 
                         
pdf.text"PAEDIATRIC WARD MANAGEMENT SYSTEM"
pdf.text"ST MARTINS' HOSPITAL"
pdf.text"P.O BOX 50"
pdf.text"MALINDI" 
pdf.move_down(10)
pdf.text "Date produced: #{Time.now.asctime }" 
pdf.move_down(10)
pdf.text "PATIENTS  WHO ARE DISCHARGED",:style => :bold  
         
patients =  @patients.map do |patient|


 [
  patient.first_name,
  patient.last_name,
  patient.age,
  patient.discharges.collect{|t| t.date_discharged},
  patient.discharges.collect{|t| t.drugs_taken_home},
  patient.discharges.collect{|t| t.discharged_by}
 ]

end

pdf.table patients, :border_style => :grid,
     :row_colors => ["FFFFFF", "DDDDDD"],
     :headers => ["First Name", "Last Name","Age","Date Discharged","Drugs Taken Home","Discharged By"],
     :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }













