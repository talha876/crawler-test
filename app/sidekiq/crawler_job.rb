require 'nokogiri'
require 'net/http'

class CrawlerJob
  include Sidekiq::Job

  def perform(url, user_agent)
    Crawler.new(url, user_agent).crawl
  end
end
