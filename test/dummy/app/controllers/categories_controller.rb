class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render :text => @categories.to_json
  end

  def new
    @category = Category.new
    @category.subcategories.build
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to categories_path, :notice => 'The new category was successfully created'
    else
      @category.subcategories.build
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @category.subcategories.build if @category.subcategories.blank?
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to categories_path, :notice => 'The category was successfully updated'
    else
      @category.subcategories.build if @category.subcategories.blank?
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    redirect_to categories_path, :notice => "The category was successfully deleted"
  end

end
