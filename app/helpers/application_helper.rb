module ApplicationHelper
  def fetch_url_preview(url)
    page = MetaInspector.new(url)
    {
      title: page.best_title,
      description: page.best_description,
      image: page.images.best
    }
  rescue
    { title: nil, description: nil, image: nil }
  end
end
