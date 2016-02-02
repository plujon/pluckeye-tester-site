helpers do
  def link_to(o)
    case o
    when User
      "<a href=\"/user/#{o.id}\">#{o}</a>"
    else
      "#{o}"
    end
  end
end
