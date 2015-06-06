class CCUrlMapper < BaseMapper
  table :cc_urls
  model CCUrl

  def reverse_map model
    {
      table[:url]     => model.url,
      table[:user_id] => model.user_id,
    }
  end
end
