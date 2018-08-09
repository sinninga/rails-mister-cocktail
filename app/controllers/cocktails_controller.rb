class CocktailsController < ApplicationController
 before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail}
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
      params.require(:cocktail).permit(:name)
  end
end
