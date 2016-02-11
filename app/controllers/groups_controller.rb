class GroupsController < ApplicationController
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @groups = Group.order(:name)
  end

  def show
    @group = Group.find(params[:id])
    @snippet = Snippet.new
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash.notice = 'group saved'
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash.notice = 'group saved'
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

  def ensure_owner
    @group = Group.find(params[:id])
    unless @group.editable_by? current_user
      flash[:error] = "You may not update #{@group.name}"
      redirect_to group_path(@group)
    end
  end

  def group_params
    params.require(:group).permit(:name, :language, :description).merge(creator:current_user)
  end
end
