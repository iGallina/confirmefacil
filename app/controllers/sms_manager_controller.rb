class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
      @appointments = Appointment.all
      @unconfirmed_appointments = Appointment.get_unconfirmed_appointments
  end

end
