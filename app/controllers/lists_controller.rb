class ListsController < ApplicationController
  def new
    @list = List.new 
  end

  def index
    @lists = List.all  
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    
    if list.destroy  # データを削除
      redirect_to lists_path, notice: '削除しました'  # 成功
    else
      redirect_to lists_path, alert: '削除に失敗しました'  # 失敗
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      render :new
    end
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
