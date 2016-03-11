require 'nokogiri'
require 'open-uri'
require 'active_support/core_ext/string/filters'
class Pnr
  def initialize
  end

  def run (pnr)
    train = Nokogiri::HTML(open("http://www.railyatri.in/pnr-status/#{pnr}"))
    text = "Train: #{train.css('div.station > a:nth-child(1)').children.to_s.squish}\n"
    text += "Status: #{train.css('div.schedule:nth-child(6) > div:nth-child(2) > span.arrival_span').children.to_s.squish}\n"
    text += "Booking status: #{train.css('div.schedule:nth-child(6) > div:nth-child(2) > span:nth-child(3)').children.to_s.squish}\n"
    text += "Chart: #{train.css('div.border_div:nth-child(5) > span:nth-child(2)').children.to_s.squish}"
    "#{text}"
  end
end
