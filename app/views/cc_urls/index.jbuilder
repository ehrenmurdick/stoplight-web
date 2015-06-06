json.cc_urls @cc_urls do |cc_url|
  json.(cc_url, :id, :url, :user_id)
end
