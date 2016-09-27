class WordsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def home
  end

  def category
      @category = params[:categoryName]
    if (params[:categoryName] == 'all')
      @words = Word.all.order("updated_at DESC")
    else
      @words = Word.where(category: params[:categoryName]).order("updated_at DESC")
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
        flash[:notice] = "You added a new word!"
        redirect_to '/category/' + category
      else
        flash[:alert] = "Sorry. Adding a word failed!"
        render 'new'
      end
  end

  def search
        @words = Word.all
    if params[:search]
      @words = Word.search(params[:search]).order("updated_at DESC")
    else
      @words = Word.all.order("updated_at DESC")
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:notice] = "Deleted a Word Successfully!"
    redirect_to '/category/' + @word.category
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Word updated"
      redirect_to '/category/' + @word.category
    else
      render 'edit'
    end
  end


  private
    def word_params
      params.require(:word).permit(:sentence,:description,:level,:category)
    end

end
