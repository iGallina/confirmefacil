class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
      @appointments = Appointment.all
      
      #TODO esse código tá replicado no confirmations_controller. Tem que ter um método no modelo que faz isso
      @unconfirmed_appointments = Appointment.paginate :page => params[:page], :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, Date.today.midnight, Date.tomorrow.midnight], :order=>'date'
  end

end
