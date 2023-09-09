module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_hash = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
