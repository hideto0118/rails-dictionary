class WordsController < ApplicationController

  def home
  end

  def category
      @category = params[:categoryName]
    if (params[:categoryName] == 'all')
      @words = Word.all
    else
      @words = Word.where(category: params[:categoryName])
    end
  end

  def new
    @word = Word.new
  end

  def create
    @word =
    Word.new(word_params)
    category = @word['category']
      if @word.save
        redirect_to '/category/' + category
      else
        render 'new'
      end
  end

  def search
        @words = Word.all
    if params[:search]
      @words = Word.search(params[:search]).order("created_at DESC")
    else
      @words = Word.all.order('created_at DESC')
    end
  end

  private
    def word_params
      params.require(:word).permit(:sentence,:description,:level,:category)
    end

end
