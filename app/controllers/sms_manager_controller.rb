class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
      @unconfirmed_appointments = Appointment.get_unconfirmed_appointments
  end

end
