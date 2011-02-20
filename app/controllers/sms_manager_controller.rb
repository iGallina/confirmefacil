class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
      @appointments = Appointment.all
  end

end
