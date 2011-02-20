require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe ConfirmationsController do
    it 'should return no appointments when there is no appointment' do
        confirmations = ConfirmationsController.new
        confirmations.get_unconfirmed_appointments.length.should == 0
    end


    it 'should return an appointment when it is not confirmed' do
        confirmations = ConfirmationsController.new
        
        appointment = Appointment.new
        appointment.date = Date.today
		appointment.doctor = "rolim"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		
		appointment.save
        
        confirmations.get_unconfirmed_appointments.length.should == 1
        confirmations.get_unconfirmed_appointments[0].doctor == "rolim"
    end
    
    it 'should return no appointment when it is confirmed' do
        confirmations = ConfirmationsController.new
        
        appointment = Appointment.new
        appointment.date = Date.today
		appointment.doctor = "rolim"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::CONFIRMED
		
		appointment.save
        
        confirmations.get_unconfirmed_appointments.length.should == 0
    end
    
    it 'should return no appointment when it will be tomorrow' do
        confirmations = ConfirmationsController.new
        
        appointment = Appointment.new
        appointment.date = Date.tomorrow
		appointment.doctor = "rolim"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		
		appointment.save
        
        confirmations.get_unconfirmed_appointments.length.should == 0
    end
    
    it 'should return 3 unconfirmed appointments' do
        confirmations = ConfirmationsController.new
        
        appointment = Appointment.new
        appointment.date = Date.today
		appointment.doctor = "rolim01"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		appointment.save

        appointment = Appointment.new
        appointment.date = Date.tomorrow
		appointment.doctor = "rolim02"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		appointment.save


        appointment = Appointment.new
        appointment.date = Date.today
		appointment.doctor = "rolim03"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		appointment.save


        appointment = Appointment.new
        appointment.date = Date.today
		appointment.doctor = "rolim04"
		appointment.client = "client"
		appointment.celular = "81050561"
		appointment.status = Appointment::SENT
		appointment.save

        confirmations.get_unconfirmed_appointments.length.should == 3
        confirmations.get_unconfirmed_appointments[0].doctor.should == "rolim01"
        confirmations.get_unconfirmed_appointments[1].doctor.should == "rolim03"
        confirmations.get_unconfirmed_appointments[2].doctor.should == "rolim04"
    end

end
