class ConfirmationsController < ApplicationController

	def get_unconfirmed_appointments
		@unconfirmed_appointments = Appointment.get_unconfirmed_appointments

		respond_to do |format|
            format.js #{render  "get_unconfirmed_appointments.js.erb"}
        end
	end

end
