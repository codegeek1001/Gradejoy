class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = current_user.categories
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = current_user.categories.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = current_user.categories.new(category_params)
    @categories = current_user.categories
    if @category.save
      respond_with(@categories)
    else
      render :new
    end
  end

  def update
    @category.update(category_params)
    @categories = current_user.categories
    respond_with(@categories)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category, :weight)
    end

    def authorized_user
      @category = current_user.categories.find_by(id: params[:id])
      redirect_to categories_path, notice: "Not authorized to view that category" if @category.nil?
    end
end
