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
    @candy = Candy.create(candy_params)
    @candy.update(image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR7PwjqnGRs8WnjryyEr8MZuI1YK7X_qfPLy6tMrdxnEHtmivVbzQ") if params[:image].nil?
    if @candy.save
      flash[:success] = "#{@candy.title} created!"
      redirect_to admin_candies_path
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
    params.require(:candy).permit(:title, :description, :price, :image, :status, :category_id)
  end
end
