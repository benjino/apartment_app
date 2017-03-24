class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :map_location] #make sure to ask for username/password before doing anything. If authentication fails, redirect to root. "user" is just the name of our model; if we changed it, it would be "authenticate_<model name>!"

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments =  Apartment.search(params[:search])
    @apartments = Apartment.all if params[:search].nil? || params[:search].strip.empty?
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        current_user.apartments << @apartment
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map_location
    @apartment = Apartment.find(params[:apartment_id])
    @address = "#{@apartment.street1} #{@apartment.street2}, #{@apartment.city}, #{@apartment.state} #{@apartment.postalcode}" #This line is redundant since you already set address in the model
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng(apartment.longitude)
      marker.infowindow("<em>" + apartment.address + "</em><br>" + apartment.name + "<br>" + apartment.phone_number + "<br>" + apartment.hours_to_contact)
    end
    render json: @hash.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:name, :phone_number, :hours_to_contact, :street1, :street2, :city, :postalcode, :state, :country, :image, :description)
    end
end
