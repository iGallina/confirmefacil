class ConfirmationsController < ApplicationController

	def get_unconfirmed_appointments
		today = Date.today.midnight
		tomorrow = Date.tomorrow.midnight
		appointments = Appointment.find(:all, :conditions=>["status=? and date>=? and date<? ", Appointment::SENT, today, tomorrow])
		return appointments
	end

end
