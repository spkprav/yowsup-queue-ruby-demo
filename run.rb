require 'beaneater'
require 'json'
require './lib/base'

# config/jobs.rb with Rails
# require File.expand_path("../environment", __FILE__)
# Rails.logger.info('hello')
# Connect to pool
@beanstalk = Beaneater.new('localhost:11300')
@tube = @beanstalk.tubes['whatsapp-receive']
loop do
  job = @tube.reserve
  # Rails.logger.info("*"*50)
  # Rails.logger.info(JSON.parse(job.body)['address'])
  # Rails.logger.info(job.body)
  @tb = @beanstalk.tubes.find('whatsapp-send')
  # Homeberry.new.run({tube: @tb, job: job})
  # case JSON.parse(job.body)['type']
    # when 'simple'
      Base.new.run(@tb, JSON.parse(job.body))
      # @tb.put({type: 'simple', body: JSON.parse(job.body)['body'], address: JSON.parse(job.body)['address']}.to_json)
      # @tb.put({type: 'image', image: '/home/ubuntu/yowsup-queue-rails-demo/sample.jpg', address: JSON.parse(job.body)['address']}.to_json)
      # @tb.put({type: 'image', image: '/home/ubuntu/yowsup-queue-rails-demo/sample.jpg', address: JSON.parse(job.body)['address']}.to_json)
    # when 'image'
      # @tb.put({type: 'image', image: '/home/ubuntu/yowsup-queue-rails-demo/sample.jpg', address: JSON.parse(job.body)['address']}.to_json)
  # end
  # Rails.logger.info("*"*50)
  job.delete
end
@beanstalk.close
