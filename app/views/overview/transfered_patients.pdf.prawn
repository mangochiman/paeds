pdf.move_down(30) 
                         
pdf.text"PAEDIATRIC WARD MANAGEMENT SYSTEM"
pdf.text"ST MARTINS' HOSPITAL"
pdf.text"P.O BOX 50"
pdf.text"MALINDI" 
pdf.move_down(10)
pdf.text "Date produced: #{Time.now.asctime }" 
pdf.move_down(10)
pdf.text "PATIENTS  TRANSFERED TO OTHER HOSPITALS",:style => :bold  
         
patients =  @patients.map do |patient|


 [
  patient.first_name,
  patient.last_name,
  patient.referrals.collect{|t| t.date_referred},
  patient.referrals.collect{|t| t.reason},
  patient.referrals.collect{|t| t.confirmed_by}
 ]

end

pdf.table patients, :border_style => :grid,
     :row_colors => ["FFFFFF", "DDDDDD"],
     :headers => ["First Name", "Last Name","Date Referred","Reason","Confirmed By"],
     :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }




























<table>
<tr class='table_header' >
  <th>First Name</th>
  <th>Last Name</th>
  <th>Date Referred</th>
  <th>Reason</th>
  <th>Confirmed By</th>
  
</tr>
<% @patients.each do |patient| %>
<tr class="<%= cycle('rowA', 'rowB') %>">
 <td><%= patient.first_name %></td>
 <td><%= patient.last_name %></td>
 <td><%= patient.referrals.collect{|t| t.date_referred}%></td>
 <td><%= patient.referrals.collect{|t| t.reason}%></td>
 <td><%= patient.referrals.collect{|t| t.confirmed_by}%></td>
 </tr>
<% end %>
</table>
<br />
<div class='count'>
Total : <%= @patients_count %> 
</div>
<div class="pdf">
<%= link_to "PDF", :controller => "overview", :action =>"with_treatment" %>
</div>


