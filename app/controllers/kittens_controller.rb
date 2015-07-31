class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.save

    redirect_to @kitten
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
