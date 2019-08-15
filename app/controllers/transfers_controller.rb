class TransfersController < ApplicationController
  require 'transfer_decorator'
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new()

    @transfer.firstname = params[:transfer][:firstname]
    @transfer.lastname = params[:transfer][:lastname]
    @transfer.dob = params[:transfer][:dob]
    @transfer.email = params[:transfer][:email]
    @transfer.phone = params[:transfer][:phone]
    @transfer.address = params[:transfer][:address]
    @transfer.firm = params[:transfer][:firm]

    myTransfer = BasicTransfer.new(10, @transfer.firm)
    if params[:transfer][:hospital].to_s.length > 0 then
      myTransfer = HospitalDecorator.new(myTransfer)
    end

    @transfer.cost = params[:transfer][:cost]
    @transfer.date = params[:transfer][:date]
    @transfer.description = myTransfer.details
    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:firstname, :lastname, :dob, :email, :phone, :address, :firm, :cost, :date, :description)
    end
end
