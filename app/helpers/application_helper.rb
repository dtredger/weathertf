module ApplicationHelper


  def full_title(page_title)
    base_title = "WeatherTF"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def random_bg
    @background = [image_path("1.jpg"),image_path("2.jpg"),image_path("3.jpg"),].sample
  end

end
