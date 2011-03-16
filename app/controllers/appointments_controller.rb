#TODO's
#    implementar o edit

class AppointmentsController < ApplicationController
  respond_to :html, :xml, :js 

  # GET /appointments
  # GET /appointments.xml
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.xml
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.xml
  def new
    @appointment = Appointment.new
    
    # date_time = params[:date] + " " + params[:time]
    # 
    # @appointment = Time.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
#    @appointment = Appointment.find(params[:id])
#    
#    respond_to do |format|
#        format.js { render 'edit_appointment_form.js.erb'}
#    end
  end

  # POST /appointments
  # POST /appointments.xml
  def create
      @appointment = Appointment.new(params[:appointment])

      respond_to do |format|
          # @appointment.save
          @appointment.status = Appointment::TO_SEND
          
          date = params[:date]
          date = date.split('/')
          date = "#{date[2]}/#{date[1]}/#{date[0]}".to_date
          @appointment.date = date
          
          if @appointment.save
          #   # format.html { redirect_to(@appointment, :notice => 'Appointment was successfully created.') }
          #   # format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
          #   
#			@appointment.send_sms

			@appointment.status = Appointment::SENT
			@appointment.save

			@appointments = Appointment.paginate :page => params[:appointments_page], :per_page => 10, :order=>'date DESC'

			format.js { render 'add_appointment.js.erb'}
          else
          #   # format.html { render :action => "new" }
          #   # format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
              format.js { render 'new_appointment.js.erb'}
          end
          
          @unconfirmed_appointments = Appointment.paginate :page => params[:conf_page], :per_page => 18, :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, Date.today.midnight, Date.tomorrow.midnight], :order=>'date DESC'
      end
  end

  # PUT /appointments/1
  # PUT /appointments/1.xml
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to(@appointment, :notice => 'Appointment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.xml
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = "Consulta desmarcada com sucesso."

	@appointments = Appointment.paginate :page => params[:appointments_page], :per_page => 10, :order=>'date DESC'
	@unconfirmed_appointments = Appointment.paginate :page => params[:conf_page], :per_page => 18, :conditions=>["(status=? or status=?) and date>=? and date<? ", Appointment::SENT, Appointment::CANCELED, Date.today.midnight, Date.tomorrow.midnight], :order=>'date DESC'
    respond_to do |format|
        format.js { render 'destroy.js.erb'}
    end

  end
end
