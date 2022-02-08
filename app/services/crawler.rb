require 'nokogiri'
require 'net/http'
require 'app_constants'

class Crawler

  def initialize(url, user_agent)
    @url = url
    @user_agent = user_agent
  end

  def crawl
    uri = URI(AppConstants::PROXY_CRAWL_URL)
    uri.query = URI.encode_www_form({ token: ENV["JS_TOKEN"], url: @url, 'User-Agent': @user_agent })
    response = Net::HTTP.get_response(uri)
    read_data(response)
  end

  def read_data(response)
    document = Nokogiri::HTML(response.body)

    document.css('div.s-main-slot.s-result-list.s-search-results.sg-row > div[data-component-type="s-search-result"]').each do |single_row|
      heading = single_row.css('span.a-size-medium.a-color-base.a-text-normal').text
      avg_rating = single_row.css('div.a-section.a-spacing-none.a-spacing-top-micro span')[0]['aria-label']

      if avg_rating.present?
        avg_rating = avg_rating.split(" out of 5 stars")[0]
      else
        avg_rating = ''
      end

      total_ratings = single_row.css('div.a-section.a-spacing-none.a-spacing-top-micro span')[3]

      if total_ratings.present?
        total_ratings = total_ratings['aria-label']
      else
        total_ratings = ''
      end

      basic_details = single_row.css('div.s-title-instructions-style > div.a-row.a-size-base.a-color-secondary span')
      esbr_rating = basic_details[0]&.text&.split("ESRB Rating: ")[1]
      release_date = basic_details[4]&.text
      brand_name = basic_details[8].text&.split("by ")[1]
      prod_url = single_row.css('div.s-price-instructions-style > div > a')[0]['href']
      price = single_row.css('div.s-price-instructions-style .a-offscreen')&.text

      previousProduct = Product.where(name: heading)

      if previousProduct.present?
        product = previousProduct.update({
          name: heading,
          avg_rating: avg_rating,
          ratings_count: total_ratings,
          esbr_rating: esbr_rating,
          release_date: release_date,
          manufacturer: brand_name,
          url: prod_url,
          price: price
        })
      else
        product = Product.new({
          name: heading,
          avg_rating: avg_rating,
          ratings_count: total_ratings,
          esbr_rating: esbr_rating,
          release_date: release_date,
          manufacturer: brand_name,
          url: prod_url,
          price: price
        })

        product.save
      end

    end
  end

end

