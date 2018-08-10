class DosesController < ApplicationController
  before_action :set_cocktail, only: [:destroy, :create, :new, :show, :edit, :update]

  def index
  end

  def new
    @dose = Dose.new
    get_all_ingredients
  end

  def create
    get_all_ingredients
    @dose = Dose.new(
      description: dose_params["description"]
    )
    if dose_params["ingredient_id"].nil? || dose_params["ingredient_id"].empty?
      render :new
    else
      @dose.ingredient = Ingredient.find(dose_params["ingredient_id"])
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
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

  def get_all_ingredients
    @ingredients = Ingredient.all
  end
end
