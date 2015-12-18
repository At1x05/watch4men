json.array!(@pages) do |page|
  json.extract! page, :id, :title, :content, :short_content_text, :tags, :description
  json.url page_url(page, format: :json)
end
