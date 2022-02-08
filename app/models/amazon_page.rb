require 'nokogiri'
require 'net/http'
require 'app_constants'
class AmazonPage < ApplicationRecord

  def self.run_crawler
    user_agent = AmazonPage.get_user_agent
    all_urls = AmazonPage.pluck(:url)
    all_urls.each do |single_url|
      CrawlerJob.perform_async(single_url, user_agent)
    end
  end

  def self.get_user_agent
    uri = URI("#{AppConstants::PROXY_CRAWL_URL}/user_agents")
    uri.query = URI.encode_www_form({ token: ENV["JS_TOKEN"] })
    response = Net::HTTP.get_response(uri)
    user_agent = JSON.parse(response.body)["agents"][0]
    user_agent
  end

end
