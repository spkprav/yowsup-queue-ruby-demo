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
      tube.put({type: 'simple', body: job['body'], address: job['address']}.to_json)
    when '/image'
      tube.put({type: 'image', image: '/home/ubuntu/yowsup-queue-rails-demo/sample.jpg', address: job['address']}.to_json)
    when '/video'
      tube.put({type: 'image', image: '/home/ubuntu/homeberry/sample.mp4', address: job['address']}.to_json)
      puts 'hey, video'
    else
      tube.put({type: 'simple', body: 'sorry, no command found', address: job['address']}.to_json)
    end
  end
end
