class RandomBooksController < ApplicationController
  include GoogleBooksApi

  def new
    @book = RandomBook.last
    now = Time.current
    # まだ完成していない
    if book.created_at-now < 0  
      @book = book
    else
      @book = nil
    end
  end

  def index
    @books = RandomBook.all
  end

  def show
    @book = RandomBook.find(id: params[:id])
  end

  def create
    if params[:random_books][:keyword].present?
      keyword = params[:random_books][:keyword]
      url = url_from_keyword(keyword)
      json = get_json_from_url(url)
      @book = {}
      if items = json['items']
        ram = rand(20)
        @book = items[ram]
        if book_create(@book)
          redirect_to random_url
        else
          flash.now[:danger] = "本を保存できませんでした。"
          redirect_to random_url
        end
      else
        flash.now[:danger] = "該当する本がありません"
        render 'new'
      end
    else
      flash.now[:danger] = "キーワードが空です。"
      render 'new'
    end
  end

  def destroy
  end

end
