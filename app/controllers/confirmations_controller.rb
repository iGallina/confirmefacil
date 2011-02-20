class ConfirmationsController < ApplicationController

	def get_unconfirmed_appointments
		today = Date.today.midnight
		tomorrow = Date.tomorrow.midnight
		@unconfirmed_appointments = Appointment.find(:all, :conditions=>["status=? and date>=? and date<? ", Appointment::SENT, today, tomorrow])

		respond_to do |format|
            format.js #{render  "get_unconfirmed_appointments.js.erb"}
        end
	end

end
