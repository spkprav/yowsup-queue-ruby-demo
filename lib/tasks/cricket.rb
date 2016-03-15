require 'feedjira'
class Cricket

  def initialize
  end

  def run (team = nil)
    url = "http://static.cricinfo.com/rss/livescores.xml"
    flag = 0
    feeds = Feedjira::Feed.fetch_and_parse url
    text = "Cricket Score\n"
    puts "team ---> #{team}"
    feeds.entries.each do |entry|
      if !team.nil?
        if entry.title.downcase.include? team.downcase
          text += "#{entry.title}\n"
          text += "more on: #{entry.url}\n"
          text += "-----------\n"
          flag = 0
        end
      else
        text += "#{entry.title}\n"
        text += "more on: #{entry.url}\n"
        text += "-----------\n"
      end
    end
    if flag == 1
      text = "No recent match for team #{team}"
    end
    puts "#{text}"
  end
end
