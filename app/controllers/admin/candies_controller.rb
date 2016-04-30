class Admin::CandiesController < Admin::AuthorizationController
  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def new
    @candy = Candy.new
  end

  def create
    @candy = Candy.new(candy_params)
    if @candy.save
      flash[:success] = "#{@candy.title} created!"
      redirect_to "/admin/candies"
    else
      flash.now[:error] = "All fields are required"
      render :new
    end
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
    params.require(:candy).permit(
                                 :title,
                                 :description,
                                 :price,
                                 :image,
                                 :status,
                                 :category_id)
  end
end
