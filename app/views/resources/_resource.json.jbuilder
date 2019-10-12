json.extract! resource, :id, :title, :description, :general, :buying, :selling, :loan, :refinance, :investing, :resource_type, :link_url, :active, :user_id, :created_at, :updated_at
json.url resource_url(resource, format: :json)
