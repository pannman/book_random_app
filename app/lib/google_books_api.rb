module GoogleBooksApi

  def get_json_from_url(url)
    JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(url))))
  end

  def url_from_keyword(keyword)
    "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP&maxResults=20"
  end

  def book_create(book)
    randombook =  RandomBook.new(title:       book["volumeInfo"]['title'],
                                 author:      book["volumeInfo"]['authors'],
                                 publisher:   book["volumeInfo"]['publisher'],
                                 description: book["volumeInfo"]['description']
                               )
    randombook.save
  end

  # # ②IDから本の情報を取得するAPIを叩く
  # def url_from_id(googlebooksapi_id)
  #   "https://www.googleapis.com/books/v1/volumes/#{googlebooksapi_id}"
  # end
end
