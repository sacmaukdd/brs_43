module UsersHelper
  def gravatar_for user, options = Settings.size_gravatar
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[Settings.size_gravatar]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.username, class: "gravatar"
  end

  def request_user requests
    requests.find_by user_id: current_user.id
  end
end
