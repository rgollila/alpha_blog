module ApplicationHelper

  # this helper method returns an image retreived from Gravatar using
  # the users email address. (See http://en.gravatar.com/site/implement/images/ruby/)
  # If the email address does not have a Wordpress account then a default image
  # is returned
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block ")
  end

end
