json.extract! meeting, :id, :title, :times, :meeting_attribute, :room, :started_at, :closed_at, :remarks, :registered_at, :updated_at, :deleted_at, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
