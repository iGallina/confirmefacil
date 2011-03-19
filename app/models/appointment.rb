require 'rest_client'

class Appointment < ActiveRecord::Base
    TO_SEND = "A ENVIAR"
    SENT = "ENVIADO"
    CONFIRMED = "CONFIRMADO"
    CANCELED = "DESMARCADO"
    
    cattr_reader :per_page
    @@per_page = 10

#    validates :date, :presence=>true
    
    def self.get_unconfirmed_appointments
		today = Date.today.midnight
		tomorrow = Date.tomorrow.midnight
		unconfirmed_appointments = Appointment.find(:all, :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, today, tomorrow], :order=>"date DESC")

		return unconfirmed_appointments
	end
	
	
	def sanitize_mobile_string
	    mobile = self.celular
	    
	    if mobile.length != 13
	        puts "número de celular inválido"
	        mobile = ""
	    else
	        mobile = mobile[1..12].split(')')
	        mobile = "55#{mobile[0]}#{mobile[1].split('.')[0]}#{mobile[1].split('.')[1]}"
	    end
	    
	    mobile
	end
	
	def create_msg_content
	    client = self.client
	    doctor = self.doctor
	    
	    if client.length + doctor.length > 40
	        if client.length > 20
	            client = client[0..19]
	        end
	        if doctor.length > 20
	            doctor = doctor[0..19]
	        end
	    end
	    	    
	    return "Olá, #{client}. Você tem uma consulta com o Dr. #{doctor} amanhã às #{self.date.strftime("%H:%M")}. Responda com 1 para confirmar ou 2 para cancelar"
	end
	
	def send_sms
        begin
            msg = create_msg_content
            mobile = sanitize_mobile_string
            response = RestClient.post 'http://system.human.com.br/GatewayIntegration/msgSms.do',
                                :content_type   => 'multipart/form-data',
                                :dispatch       => 'send',
                                :account        => 'muxtec',
                                :code           => 'nqngbTypBK',
                                :msg            => msg,
                                :from           => 'uana',
                                :to             => '556181185049',
                                :id             => self.id.to_s,
                                :schedule       => (Time.now + 1.minute).strftime("%d/%m/%Y %H:%M:%S"),
                                :callbackOption => '2'
            
            puts "oi, label! Fiz o post: #{response.inspect}"
            
        rescue Exception => e
            puts("[#{Time.now}] [deu pau] [#{@e}]")
            raise "deu pau #{e.inspect}"
        end
        return true
    end

end
