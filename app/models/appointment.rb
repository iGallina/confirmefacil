class Appointment < ActiveRecord::Base
    TO_SEND = "A_ACONTECER"
    SENT = "ENVIADO"
    CONFIRMED = "CONFIRMADO"
    CANCELED = "DESMARCADO"
end
