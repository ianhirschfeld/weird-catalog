module ApplicationHelper

  def facebook_share_url(item)
    "http://www.facebook.com/share.php?u=#{catalog_item_url(item)}"
  end

  def facebook_share_text(item)
    "#{item.description} #GetWeird #{catalog_item_url(item)}"
  end

  def twitter_share_url(item)
    # TweetLength - url - hastags - intro - item.name
    truncate_limit = 140 - 23 - 10 - 27 - item.name.length
    tweet_text = url_encode("Found on @WeirdCatalog: #{item.name} - #{item.description_truncated(truncate_limit)}")
    "https://twitter.com/share?text=#{tweet_text}&hashtags=GetWeird&url=#{catalog_item_url(item)}"
  end

  def twitter_share_text(item)
    "#{item.description_truncated(140 - 23 - 10)} #GetWeird #{catalog_item_url(item)}"
  end

  def send_item_to_buffer(item)
    buffer = Buffer::Client.new ENV['BUFFER_ACCESS_TOKEN']
    buffer_profiles = buffer.profiles
    data = {body: {shorten: true}}

    buffer_profiles.each do |profile|
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
