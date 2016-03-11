class Help

  def initialize

  end

  def run
    txt = %Q([HELP] - Commands

/help or /h - Show this message
/hi - Replies Hey, what\'s up?
/echo - Echo
/about - about text
/image - Sends an images
/pnr 1234567890 - Check your pnr status)
  return txt
  end
end
