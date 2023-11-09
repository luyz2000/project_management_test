json.extract! proyect, :id, :title, :slug, :description, :status, :created_at, :updated_at
json.url proyect_url(proyect, format: :json)
