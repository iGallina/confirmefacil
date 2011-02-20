require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe ConfirmationsController do
    it 'should return no appointments when there is no appointment' do
        confirmations = ConfirmationsController.new
        confirmations.get_appointments.length.should == 0
    end


    it 'should return an appointment when it is not confirmed' do
        confirmations = ConfirmationsController.new
        
        
        confirmations.get_appointments.length.should == 0
    end

end
