class ConfirmationsController < ApplicationController

	def get_unconfirmed_appointments
#		@unconfirmed_appointments = Appointment.get_unconfirmed_appointments

		today = Date.today.midnight
		tomorrow = Date.tomorrow.midnight
		@unconfirmed_appointments = Appointment.paginate :page => params[:page], :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, today, tomorrow], :order=>'date'

		respond_to do |format|
            format.js #{render  "get_unconfirmed_appointments.js.erb"}
        end
	end

end
