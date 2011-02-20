class ConfirmationsController < ApplicationController

	def get_unconfirmed_appointments
		appointments = Appointment.all
		return appointments
	end

end
