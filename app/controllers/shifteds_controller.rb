class ShiftedsController < ApplicationController
  require 'shifted_decorator'
  before_action :set_shifted, only: [:show, :edit, :update, :destroy]

  # GET /shifteds
  # GET /shifteds.json
  def index
    @shifteds = Shifted.all
  end

  def import
    Shifted.import(params[:file])
    redirect_to shifteds_path, notice: "Doctors Added successfully"
  end
  # GET /shifteds/1
  # GET /shifteds/1.json
  def show
  end

  # GET /shifteds/new
  def new
    @shifted = Shifted.new
  end

  # GET /shifteds/1/edit
  def edit
  end

  # POST /shifteds
  # POST /shifteds.json
  def create
    @shifted = Shifted.new()

    @shifted.firstname = params[:shifted][:firstname]
    @shifted.lastname = params[:shifted][:lastname]
    @shifted.dob = params[:shifted][:dob]
    @shifted.email = params[:shifted][:email]
    @shifted.phone = params[:shifted][:phone]
    @shifted.address = params[:shifted][:address]
    @shifted.firm = params[:shifted][:firm]
          # create an instance/object of a BasicShift
    myShifted = BasicShifted.new(10, @shifted.firm)
          # add the extra features to the new shiftted

          if params[:shifted][:bloodtest].to_s.length > 0 then
            myShifted = BloodtestDecorator.new(myShifted)
          end

          if params[:shifted][:windows].to_s.length > 0 then
              myShifted = XrayDecorator.new(myShifted)
          end

          if params[:shifted][:ctscan].to_s.length > 0 then
              myShifted = CtscanDecorator.new(myShifted)
          end
          if params[:shifted][:endoscopy].to_s.length > 0 then
              myShifted = EndoscopyDecorator.new(myShifted)
          end


          ## populate the cost and the description details
          @shifted.cost = myShifted.cost
          @shifted.description = myShifted.details
          respond_to do |format|
          if @shifted.save
              format.html { redirect_to @shifted, notice: 'Shift was successfully created.'}
              format.json { render :show, status: :created, location: @shifted }
            else
              format.html { render :new }
              format.json { render json: @shifted.errors, status: :unprocessable_entity }
            end
          end
  end

  # PATCH/PUT /shifteds/1
  # PATCH/PUT /shifteds/1.json
  def update
    respond_to do |format|
      if @shifted.update(shifted_params)
        format.html { redirect_to @shifted, notice: 'Shifted was successfully updated.' }
        format.json { render :show, status: :ok, location: @shifted }
      else
        format.html { render :edit }
        format.json { render json: @shifted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifteds/1
  # DELETE /shifteds/1.json
  def destroy
    @shifted.destroy
    respond_to do |format|
      format.html { redirect_to shifteds_url, notice: 'Shifted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shifted
      @shifted = Shifted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shifted_params
      params.require(:shifted).permit(:firstname, :lastname, :dob, :email, :phone, :address, :firm, :cost, :description)
    end

end
