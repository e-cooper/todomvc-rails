class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  def index
    @todo_lists = TodoList.all
    render json: @todo_lists
  end

  # GET /todo_lists/1
  def show
    render json: @todo_list, include: ['todos']
  end

  # POST /todo_lists
  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      render json: @todo_list, include: ['todos'], status: :created,
        location: list_path(@todo_list)
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todo_lists/1
  def update
    if @todo_list.update(todo_list_params)
      render json: @todo_list, include: ['todos'], status: :ok,
        location: list_path(@todo_list)
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todo_lists/1
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.includes(:todos).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_list_params
      params.require(:list).permit(todos_attributes: [:id, :title,
        :is_completed, :_destroy])
    end
end
