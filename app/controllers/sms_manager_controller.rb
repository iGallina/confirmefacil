class SmsManagerController < ApplicationController
  def index
      @appointment = Appointment.new
  end

end
