class WordsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def home
  end

  def category
      @category = params[:categoryName]
    if (params[:categoryName] == 'all')
      @words = Word.all.order('created_at DESC')
    else
      @words = Word.where(category: params[:categoryName]).order('created_at DESC')
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

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to root_url
  end


  private
    def word_params
      params.require(:word).permit(:sentence,:description,:level,:category)
    end

end
