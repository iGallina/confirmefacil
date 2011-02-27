class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
      @appointments = Appointment.paginate :page => params[:appointments_page], :order=>'date DESC'
      
      #TODO esse código tá replicado no confirmations_controller. Tem que ter um método no modelo que faz isso
      @unconfirmed_appointments = Appointment.paginate :page => params[:conf_page], :per_page => 18, :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, Date.today.midnight, Date.tomorrow.midnight], :order=>'date DESC'
  end

end
