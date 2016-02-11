class SnippetsController < ApplicationController

  def index
    @snippets =  Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
    # binding.pry
  end

  def edit
    @snippet = Snippet.find(params[:id])
  end

  def update
    @snippet = Snippet.find(params[:id])
    @group = @snippet.group
    if @snippet.update(snippet_params)
      flash.notice = 'snippet saved'
      # redirect_to snippet_path(@snippet)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def create
    @group = Group.find(params[:group_id])
    if @group.editable_by? current_user
      create_snippet @group
    else
      flash.alert = 'You may only add snippets to your own groups'
      render 'groups/show'
    end
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @group = @snippet.group
    @snippet.destroy
    redirect_to group_path(@group)
  end

  def latest
    @latest = snippet.includes(:group).order(created_at: :desc).limit(10)
  end

  private

  def create_snippet group
    @snippet = @group.snippets.build(snippet_params)
    if @snippet.save
      flash.notice = 'You\'ve successfully added a snippet'
      redirect_to group_path(@group)
    else
      flash.alert = 'Sorry your snippet failed to save'
      render 'groups/show'
    end
  end

  def snippet_params
    params.require(:snippet).permit(:name, :content)
  end
end
