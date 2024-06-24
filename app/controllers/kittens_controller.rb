class KittensController < ApplicationController
  before_action :set_kitten, only: %i[ show edit update destroy ]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to kitten_url(@kitten), notice: 'Kitten was sucessfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to kitten_url(@kitten), notice: 'Kitten was sucessfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @kitten.destroy!

    redirect_to kittens_url, success: 'Kitten was sucessfully deleted!'
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
