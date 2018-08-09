class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new, :show, :edit, :update, :destroy]

  def index
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(
      description: dose_params["description"]
    )
    @dose.ingredient = Ingredient.find(dose_params["ingredient_id"])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def show
  end

  def update
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
