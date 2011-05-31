 
pdf.move_down(30) 
                         
pdf.text"PAEDIATRIC WARD MANAGEMENT SYSTEM"
pdf.text"ST MARTINS' HOSPITAL"
pdf.text"P.O BOX 50"
pdf.text"MALINDI" 
pdf.move_down(10)
pdf.text "Date produced: #{Time.now.asctime }" 
pdf.move_down(10)
pdf.text "PATIENTS  WITH  TREATMENT",:style => :bold  
         
patients =  @patients.map do |patient|


 [
  patient.first_name,
  patient.last_name,
  patient.age,
  patient.treatments.collect{|t| t.drug_name},
  patient.treatments.collect{|t| t.quantity},
  patient.treatments.collect{|t| t.prescibed_by}
 ]

end

pdf.table patients, :border_style => :grid,
     :row_colors => ["FFFFFF", "DDDDDD"],
     :headers => ["First Name", "Last Name","Age","Drug name","Quantity","Prescribed By"],
     :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }

