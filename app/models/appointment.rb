class Appointment < ActiveRecord::Base
    TO_SEND = "A_ACONTECER"
    SENT = "ENVIADO"
    CONFIRMED = "CONFIRMADO"
    CANCELED = "DESMARCADO"
    
    cattr_reader :per_page
    @@per_page = 10
    # validates :date, :presence=>true
    
    def self.get_unconfirmed_appointments
		today = Date.today.midnight
		tomorrow = Date.tomorrow.midnight
		unconfirmed_appointments = Appointment.find(:all, :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, today, tomorrow])

		return unconfirmed_appointments
	end
    
end
