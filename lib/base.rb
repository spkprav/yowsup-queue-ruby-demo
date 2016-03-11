class Base
  def initialize
  end

  def run(tube, job)
    commands = job['body'].split(' ')
    main_command = commands[0]
    case main_command
    when '/hi'
      tube.put({type: 'simple', body: 'Hey, what\'s up?', address: job['address']}.to_json)
    when '/echo'
      cmd = job['body'].split(' ')[1..-1].join(' ')
      tube.put({type: 'simple', body: cmd, address: job['address']}.to_json)
    when '/image'
      tube.put({type: 'image', image: '/home/praveen/projects/mine/ruby/yowsup-queue-ruby-demo/sample.jpg', address: job['address']}.to_json)
    when '/video'
      tube.put({type: 'video', video: '/home/praveen/projects/mine/python/yowsup-stalker/sample.mp4', address: job['address']}.to_json)
      # To be implemented
    when '/h', '/help'
      #help commands
      help_text = %Q([HELP] - Commands

/help or /h - Show this message
/hi - Replies Hey, what\'s up?
/echo - Echo
/image - Sends an images)
      tube.put({type: 'simple', body: help_text, address: job['address']}.to_json)
    else
      if main_command[0] == '/'
        tube.put({type: 'simple', body: 'sorry, no command found', address: job['address']}.to_json)
      end
    end
  end
end
