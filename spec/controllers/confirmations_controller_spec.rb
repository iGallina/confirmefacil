require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe ConfirmationsController do
    it 'should return no appointments when there is no appointment' do
        confirmations = ConfirmationsController.new
        confirmations.get_unconfirmed_appointments.length.should == 0
    end


    it 'should return an appointment when it is not confirmed' do
        confirmations = ConfirmationsController.new
        
        appointment = Appointment.new
		appointment.doctor = "rolim"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = 0
		
		appointment.save
        
        confirmations.get_unconfirmed_appointments.length.should == 1
        confirmations.get_unconfirmed_appointments[0].doctor == "rolim"
    end

end
