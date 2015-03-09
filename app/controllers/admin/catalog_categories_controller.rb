class Admin::CatalogCategoriesController < ProtectedController

  before_action :load_model, only: [:edit, :update, :destroy]

  def index
    @categories = CatalogCategory.order('name ASC')
  end

  def new
    @category = CatalogCategory.new
  end

  def edit
  end

  def create
    @category = CatalogCategory.new catalog_category_params

    if @category.save
      redirect_to admin_catalog_categories_path, notice: 'Catalog category successfully created!'
    else
      render template: 'admin/catalog_categories/new'
    end
  end

  def update
    if @category.update_attributes(catalog_category_params)
      redirect_to admin_catalog_categories_path, notice: 'Catalog category successfully updated!'
    else
      render template: 'admin/catalog_categories/edit'
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_catalog_categories_path, notice: 'Catalog category successfully deleted!'
    else
      redirect_to admin_catalog_categories_path, notice: 'There was an error trying to delete your category.'
    end
  end

  private

  def load_model
    @category ||= CatalogCategory.friendly.find(params['id'])
  end

  def catalog_category_params
    params.require(:catalog_category).permit(:name)
  end

end
