json.array!(@courses) do |course|
  json.extract! course, :id, :name, :period, :section, :time
  json.url course_url(course, format: :json)
end
