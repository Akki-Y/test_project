class CategoriesController < ApplicationController

  before_action :set_category, only: %w[edit destroy update]

  def index 
    @categories = Category.all
  end
   
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html{redirect_to categories_url(@category), notice: "Category was successfully created."}
      else
        format.html{render :new, status: :unprocessable_entity}
      end
    end
  end
 
  def update
    if @category.update(category_params)
      redirect_to categories_path
    end
  end
  
  def destroy
    if @category.destroy
      redirect_to categories_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
