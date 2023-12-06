class TransactionsController < ApplicationController
  def show
  end

  def new
    @entity = GroupEntity.new
    @category = Group.find(params[:category_id])
  end

  def create
    @category = Group.find(params[:group_entity][:category])
    @entity = current_user.entities.create( name: params[:group_entity][:name], amount: params[:group_entity][:amount] )
    @group_entity = @category.group_entities.create( group_id: @category.id, entity_id: @entity.id )

    if @entity.save && @group_entity.save
      redirect_to category_path(@category), notice: 'Transaction created successfully'
    else
      redirect_to new_transaction_path, notice: 'Transaction was not created'
    end
  end
end