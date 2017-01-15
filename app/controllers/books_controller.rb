class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    @book = Book.create(create_params)
  end

  def registration
    @book = Book.new(registration_params)
  end

  def search
    @books = []

    # キーワードが存在しない場合は終了
    return @books unless params[:keyword].present?

    # デバックログ出力するために記述
    Amazon::Ecs.debug = true

    begin
      # Amazon::Ecs::Responceオブジェクトの取得
      search_result = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
        )
    rescue Amazon::RequestError => e
      puts e
      retry
    end

    # 本のタイトル,画像URL, 詳細ページURLの取得
    search_result.items.each do |item|
      book = Book.new(
        title: item.get('ItemAttributes/Title'),
        image_url: item.get('LargeImage/URL'),
        detail_url: item.get('DetailPageURL'),
        author: item.get('ItemAttributes/Author'),
        publisher: item.get('ItemAttributes/Publisher')
        )
      @books << book
    end
  end

  private
  def create_params
    params.require(:book).permit(:title, :image_url, :detail_url, :author, :publisher).merge(user_id: current_user.id)
  end

  def registration_params
    params.require(:book).permit(:title, :image_url, :detail_url, :author, :publisher)
  end
end