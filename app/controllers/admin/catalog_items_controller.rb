class Admin::CatalogItemsController < ProtectedController

  before_action :load_model, only: [:edit, :update, :destroy]

  def index
    @items = CatalogItem.order('created_at DESC')
  end

  def new
    @item = CatalogItem.new
  end

  def edit
  end

  def create
    @item = CatalogItem.new catalog_item_params

    if @item.save
      redirect_to admin_catalog_items_path, notice: 'Catalog item successfully created!'
    else
      render template: 'admin/catalog_items/new'
    end
  end

  def update
    if @item.update_attributes(catalog_item_params)
      redirect_to admin_catalog_items_path, notice: 'Catalog item successfully updated!'
    else
      render template: 'admin/catalog_items/edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to admin_catalog_items_path, notice: 'Catalog item successfully deleted!'
    else
      redirect_to admin_catalog_items_path, notice: 'There was an error trying to delete your item.'
    end
  end

  private

  def load_model
    @item ||= CatalogItem.find(params['id'])
  end

  def catalog_item_params
    params.require(:catalog_item).permit(
      :name,
      :description,
      :url,
      :creator,
      :catalog_category_id,
      :released_at
    )
  end

end
