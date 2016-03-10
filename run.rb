require 'beaneater'
require 'json'
require './lib/base'

# Connect to pool
@beanstalk = Beaneater.new('localhost:11300')
@tube = @beanstalk.tubes['whatsapp-receive']
loop do
  job = @tube.reserve
  @tb = @beanstalk.tubes.find('whatsapp-send')
  Base.new.run(@tb, JSON.parse(job.body))
  job.delete
end
@beanstalk.close
