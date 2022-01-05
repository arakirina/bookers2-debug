class SearchesController < ApplicationController

  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model,@content,@method)
  end

  private

  def search_for(model,content,method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == "partical"
        User.where('name LIKE ?' , "%#{content}%" )
      elsif method == "forward"
        User.where('name LIKE ?' , "#{content}%" )
      elsif method == "backward"
        User.where('name LIKE ?' , "%#{content}" )
      end
    elsif model == 'book'
      if method == "perfect"
        Book.where(title: content)
      elsif method == "partical"
        Book.where('title LIKE ?' , "%#{content}%" )
      elsif method == "forward"
        Book.where('title LIKE ?' , "#{content}%" )
      elsif method == "backward"
        Book.where('title LIKE ?' , "%#{content}" )
      end
    end
  end

end
