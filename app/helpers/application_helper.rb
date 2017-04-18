module ApplicationHelper

  def key_for(data)
    Digest::MD5.digest(data.to_json)
  end
end
