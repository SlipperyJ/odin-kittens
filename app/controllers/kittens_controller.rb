class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    find_kitten
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    find_kitten
  end

  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.save

    redirect_to @kitten
  end

  def destroy
    find_kitten
    @kitten.destroy

    redirect_to kittens_path
  end

  def update
    find_kitten
    if @kitten.update(kitten_params)
      flash[:success] = "Succesfully edited your kitten!"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

    def find_kitten
      @kitten = Kitten.find(params[:id])
    end

end
