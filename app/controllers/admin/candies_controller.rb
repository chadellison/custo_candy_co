class Admin::CandiesController < Admin::AuthorizationController
  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def edit
    @candy = Candy.find(params[:id])
  end

  def update
    candy = Candy.find(params[:id])
    candy.update(candy_params)
    redirect_to admin_candies_path
  end

  private

  def candy_params
    params.require(:candy).permit(:title, :description, :price, :image, :status)
  end
end
