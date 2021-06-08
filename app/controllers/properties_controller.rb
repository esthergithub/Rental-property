class PropertiesController < ApplicationController
before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    if params[:back]
		  @property = Property.new(property_params)
    else
      @property = Property.new
      2.times { @property.nearest_stations.build }
    end
  end

  def show
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
      if params[:back]
        render :new
      else
        if @property.save
          redirect_to properties_path, notice:"Property was successfully created！"
        else
          render :new
        end
      end
  end

  def update
	    if @property.update(property_params)
	      redirect_to properties_path, notice: "Property was successfully updated！"
	    else
	      render :edit
      end
  end

  def destroy
    @property.destroy
      redirect_to properties_path, notice:"Property was successfully destroyed！"
  end

  def confirm
		@property = Property.new(property_params)
    render :new if @property.invalid?
	end


  private
  def property_params
    params.require(:property).permit(:name, :rent, :address, :year, :memo, nearest_stations_attributes:[:id, :station, :route, :time])
  end

  def set_property
    @property = Property.find(params[:id])
  end

end
