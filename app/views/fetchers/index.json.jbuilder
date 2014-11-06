json.array!(@fetchers) do |fetcher|
  json.extract! fetcher, :id
  json.url fetcher_url(fetcher, format: :json)
end
