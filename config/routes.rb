Rails.application.routes.draw do
  get 'top' => 'homes#top'

  # 個別のルーティング設定
  get '/lists' => 'lists#index', as: 'lists'           # 投稿一覧画面
  get '/lists/new' => 'lists#new', as: 'new_list'       # 新規作成画面
  post '/lists' => 'lists#create', as: 'create_list'    # 新規作成
  get '/lists/:id' => 'lists#show', as: 'list'          # 詳細表示
  get '/lists/:id/edit' => 'lists#edit', as: 'edit_list' # 編集画面
  patch '/lists/:id' => 'lists#update', as: 'update_list' # 更新
  delete '/lists/:id' => 'lists#destroy', as: 'destroy_list' # 削除
end
