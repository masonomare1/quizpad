
json.status "success"
json.data do
    json.array! @options do |option|
    json.id option.hashid
    json.description option.description
    json.url api_v1_option_path(option.hashid)
  end
end