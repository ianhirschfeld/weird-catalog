require "#{Rails.root}/app/helpers/application_helper"

class CatalogItemService
  class << self

    include ApplicationHelper

    def send_to_buffer(item)
      buffer = Buffer::Client.new ENV['BUFFER_ACCESS_TOKEN']
      profiles = buffer.profiles
      pending = buffer.updates_by_profile_id profiles.first[:id], status: 'pending'
      data = {body: {shorten: true}}

      # 10 posts is the max allowed in queue for free accounts.
      if pending.total < 10
        profiles.each do |profile|
          case profile[:service]
          when 'facebook'
            data[:body][:profile_ids] = [profile[:id]]
            data[:body][:text] = facebook_share_text(item)
            buffer.create_update data
          when 'twitter'
            data[:body][:profile_ids] = [profile[:id]]
            data[:body][:text] = twitter_share_text(item)
            buffer.create_update data
          end
        end

        item.update_attributes send_to_buffer: false
      end
    end

  end
end
