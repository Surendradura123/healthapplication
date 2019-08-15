class PatientsController < ApplicationController

  def price
       @input1 = params[:search_string]
       @result = Checkprice.runcheck(@input1.to_i)
    end

  # GET docotors/1/patients
  def index
      @doctor = Doctor.find(params[:doctor_id])
      @patients = @doctor.patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:id])
  end

  # GET /patients/new
  def new
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.build
  end

  # GET /patients/1/edit
  def edit
      @doctor = Doctor.find(params[:doctor_id])
      @patient = @doctor.patients.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.build(params.require(:patient).permit(:firstname, :lastname, :dob,:gender, :email, :phone, :address,:condition,:level,:search))

      if @patient.save
        redirect_to doctor_patient_url(@doctor, @patient)
      else
        render :action => "new"
      end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])

      if @patient.update_attributes(params.require(:patient).permit(:firstname, :lastname, :dob,:gender, :email, :phone, :address,:condition,:level,:search))
         redirect_to doctor_patient_url(@doctor,@patient)
      else
       render :action => "edit"
      end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to doctor_patients_url(@doctor), notice: 'Patient was successfully destroyed.' }
      format.xml { head :ok }
    end
  end


end
