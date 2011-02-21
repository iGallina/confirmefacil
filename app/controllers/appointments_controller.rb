class AppointmentsController < ApplicationController
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
    @appointment = Appointment.find(params[:id])
    
    respond_to do |format|
        format.js { render 'edit_appointment_form.js.erb'}
    end
  end

  # POST /appointments
  # POST /appointments.xml
  def create
      @appointment = Appointment.new(params[:appointment])

      respond_to do |format|
          @appointment.save
          # if @appointment.save
          #   # format.html { redirect_to(@appointment, :notice => 'Appointment was successfully created.') }
          #   # format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
          #   
          #   format.js { render 'add_appointment.js.erb'}
          # else
          #   # format.html { render :action => "new" }
          #   # format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
          # end

          format.js { render 'add_appointment.js.erb'}
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
    puts "--------------- Teste"
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    @appointments = Appointment.all
    respond_to do |format|

      format.html { redirect_to(:root, :notice => 'Consulta excluido com sucesso.') }
      format.xml  { head :ok }
      #format.js { render "refresh_appointment_list.js.erb" }
    end
  end
end
