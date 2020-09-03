json.extract! company, :id, :company_name, :tax_code, :address, :position, :created_at, :updated_at
json.url company_url(company, format: :json)
