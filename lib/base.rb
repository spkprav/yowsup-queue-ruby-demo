Dir["./lib/tasks/*.rb"].each {|file| require file }
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
      tube.put({type: 'image', image: '/home/ubuntu/yowsup-queue-rails-demo/sample.jpg', address: job['address']}.to_json)
    when '/video'
      # To be implemented
    when '/pnr'
      status = Pnr.new.run(commands[1])
      tube.put({type: 'simple', body: status, address: job['address']}.to_json)
    when '/news'
      news = News.new.run()
      tube.put({type: 'simple', body: news, address: job['address']}.to_json)
    when '/h', '/help'
      #help commands
      help_text = Help.new.run()
      tube.put({type: 'simple', body: help_text.to_s, address: job['address']}.to_json)
    when '/about'
      about_text = %Q(-By
Praveen Kumar S.
Krishnakumar S.
      )
      tube.put({type: 'simple', body: about_text, address: job['address']}.to_json)
    else
      if main_command[0] == '/'
        tube.put({type: 'simple', body: 'sorry, no command found', address: job['address']}.to_json)
      end
    end
  end
end
