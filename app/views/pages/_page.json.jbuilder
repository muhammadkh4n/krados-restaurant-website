json.extract! page, :id, :page, :title, :text, :created_at, :updated_at
json.url page_url(page, format: :json)
