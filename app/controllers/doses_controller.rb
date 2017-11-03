class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy ]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all - @cocktail.ingredients
    @dose = Dose.new
  end

  def create
    raise
    cocktail_id = params[:cocktail_id]
    ingredient_id = params[:dose][:ingredient_id]
    @cocktail = Cocktail.find(cocktail_id)
    @dose = Dose.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
