class CreateAppointments < ActiveRecord::Migration
    def self.up
        create_table :appointments do |t|
            t.datetime :date
            t.string :doctor
            t.string :client
            t.string :celular
            t.string :status
            t.timestamps
        end
    end

    def self.down
        drop_table :appointments
    end
end
