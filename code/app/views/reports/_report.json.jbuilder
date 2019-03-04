json.extract! report, :id, :date, :time, :location, :details, :created_at, :updated_at
json.url report_url(report, format: :json)
