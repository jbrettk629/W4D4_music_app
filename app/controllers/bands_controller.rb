class BandsController < ApplicationController
  # helper_function :all_bands
  # 
  # def all_bands
  #   Band.all 
  # end 
  
  def index 
    @bands = Band.all 
    render :index
  end 
  
  def new
    @band = Band.new
    render :new
  end 
  
  def create
    @band = Band.new(band_params)
    
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = "You need to enter a band name!"
      render :new
    end 
  end
  
  def edit
    @band = Band.find_by(id: params[:id])
  end 
  
  def show 
    @band = Band.find_by(id: params[:id])
    render :show
  end 
  
  def update
    @band = Band.find_by(id: params[:id])
    
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else 
      flash[:errors] = "Something went wrong, try again."
      render :edit 
    end 
  end 
  
  def destroy
    @band = Band.find_by(id: params[:id])
    @band.delete
    redirect_to bands_url
  end 
  
  def band_params
    params.require(:band).permit(:name)
  end 
  
  
end 