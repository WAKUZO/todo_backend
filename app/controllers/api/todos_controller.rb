class Api::TodosController < ApplicationController
  # タスクの取得
  def index
    # taskテーブルのすべてのレコードを取得
    todos = Todo.all
    # json形式でレスポンスされる
    render json: todos
  end

  # タスクの作成
  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "タスクの作成に失敗しました" }
    end
  end

  # タスクの完了・未完了
  def update
    todo = Todo.find(params[:id])

    if todo.update(todo_params)
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "タスクの更新に失敗しました" }
    end
  end

  # タスクの削除
  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "タスクの削除に失敗しました" }
    end
  end
  
  private

  def todo_params
    params.permit(:title, :is_done)
  end
end