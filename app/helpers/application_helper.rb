module ApplicationHelper

  include Routing

  def facebook_share_url(item)
    "http://www.facebook.com/share.php?u=#{catalog_item_url(item)}"
  end

  def facebook_share_text(item)
    generator = UrlGenerator.new
    "#{item.description} #GetWeird #{generator.catalog_item_url(item)}"
  end

  def twitter_share_url(item)
    # TweetLength - url - hastags - intro - item.name
    truncate_limit = 140 - 23 - 10 - 27 - item.name.length
    tweet_text = url_encode("Found on @WeirdCatalog: #{item.name} - #{item.description_truncated(truncate_limit)}")
    "https://twitter.com/share?text=#{tweet_text}&hashtags=GetWeird&url=#{catalog_item_url(item)}"
  end

  def twitter_share_text(item)
    generator = UrlGenerator.new
    "#{item.description_truncated(140 - 23 - 10)} #GetWeird #{generator.catalog_item_url(item)}"
  end

end
