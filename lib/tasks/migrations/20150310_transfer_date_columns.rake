require 'tasks/helpers/rake_logger'

namespace :migrations do

  task transfer_date_columns: :environment do
    RakeLogger.log "=== Transfering Date Columns ==="

    CatalogItem.find_each do |item|
      RakeLogger.log "Updating item: #{item.id}"
      date = item.released_date
      item.released_year = date.year
      item.released_month = date.month
      item.released_day = date.day
      item.save
    end

    RakeLogger.log '~ ALL DONE ~'
  end

end
