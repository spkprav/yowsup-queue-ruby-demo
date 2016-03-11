require 'nokogiri'
require 'open-uri'
class News

  def initialize
  end

  def run
    news = Nokogiri::HTML(open("https://www.inshorts.com/en/read"))
    text = "Live News\n"
    5.times do |i|
      text += news.css("div.card-stack > div:nth-child(#{i+1}) > div.news-card-title.news-right-box > a > span").children.to_s+"\n"
      text += news.css("div.card-stack > div:nth-child(#{i+1}) > div.news-card-content.news-right-box > div:nth-child(1)").children.to_s+"\n"
      text += "Read more at: \n"
      text += "-------------\n"
    end
    return text
  end

end
