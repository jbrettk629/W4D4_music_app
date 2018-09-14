class AlbumsController < ApplicationController

    def new
      @album = Album.new
    end 

    def create
      @album = Album.new(album_params)

      if @album.save
        redirect_to album_url(@album)
      else 
        flash[:errors] = "Oops, something happened! Try again."
        render :new
      end
    end

    def show
      @album = Album.find_by(id: params[:id])
      render :show  
    end  

    def edit
      @album = Album.find_by(id: params[:id])
      render :edit
    end 

    def update
      @album = Album.find_by(id: params[:id])
      
      if @album.update_attributes(band_params)
        redirect_to band_url(@album)
      else 
        flash[:errors] = "Something went wrong, try again."
        render :edit 
      end 
    end 

    def destroy
      @album = Album.find_by(id: params[:id])
      @album.delete
      redirect_to bands_url
    end

    def album_params 
      params.require(:album).permit(:band_id, :title, :year, :studio)
    end 

end