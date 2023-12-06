class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def new
    @group = Group.new
    @icon_files = Dir.glob('public/icons/*.png').map do |file_path|
      File.basename(file_path)
    end
  end

  def show
    @category = Group.find(params[:id])
    @transactions = @category.group_entities.order(created_at: :desc)
    @total_amount = 0
    @transactions.each do |item|
      @total_amount += Entity.find(item.entity_id).amount
    end
  end

  def create
    @icon_path = 'public/icons/' + params[:group][:icon]
    @category = current_user.groups.create(name: params[:group][:name], icon: @icon_path)
    if @category.save
      redirect_to categories_path, notice: 'Categorie was successfully created'
    else
      redirect_to new_category_path, notice: 'Categories not created!'
    end
  end
end