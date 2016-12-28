class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index; redirect_to :action => 'new' ; end

  def edit
    set_categories
    @category_id = params[:id]

    if @category_id.present?
      @category = Category.find(params[:id])
      @category.attributes = params[:category]
      if request.post?
        respond_to do |format|
          format.html { save_category }
          format.js do
            @category.save
            @article = Article.new
            @article.categories << @category
            return render(:partial => 'admin/content/categories')
          end
        end
        return
      end
    else
      redirect_to :action => 'create', category: params[:category]
      return
    end
    render 'new'

  end

  def create
    @category = Category.create(params[:category])
    save_category
  end

  def new
    set_categories

    respond_to do |format|
      format.html { }
      format.js {
        @category = Category.new
      }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def set_categories
    @categories = Category.find(:all)
  end

  def save_category
    if @category.save!
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'new'
  end

end
