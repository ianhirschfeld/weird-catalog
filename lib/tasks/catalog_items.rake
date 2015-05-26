require 'tasks/helpers/rake_logger'

namespace :catalog_items do

  task send_to_buffer: :environment do
    RakeLogger.log "=== Sending Catalog Items to Buffer ==="

    items = CatalogItem.published.where(send_to_buffer: true)
    items.each do |item|
      RakeLogger.log "Sending item: #{item.id} - #{item.name}"
      CatalogItemService.send_to_buffer(item)
    end

    RakeLogger.log '~ ALL DONE ~'
  end

end
