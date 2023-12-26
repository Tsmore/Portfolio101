module ApplicationHelper

  require 'mechanize'

  def fetch_page_info(url)
    agent = Mechanize.new
    page = agent.get(url)

    title = page.title
    description = page.search("meta[name=description]").first&.attributes["content"]&.value
    image = page.search("meta[property='og:image']").first&.attributes["content"]&.value

    { title: title, description: description, image: image }
  rescue => e
    Rails.logger.error "Mechanize error: #{e.message}"
    { title: nil, description: nil, image: nil }
  end

  def time_ago_with_suffix(time)
    "#{time_ago_in_words(time)}前"
  end

end
