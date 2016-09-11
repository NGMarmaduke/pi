require 'logger'
require 'multi_io'
require 'dotenv'
Dotenv.load

module Pi
  module_function

  def gpio_available?
    !(ENV.fetch('PREVENT_GPIO', false) == 'true')
  end

  def loop_with_error_handling(sleep_for:, &block)
    loop do
      begin
        yield
      rescue StandardError => e
        logger.error(e)
      ensure
        sleep(sleep_for)
      end
    end
  end

  def logger
    @logger ||= begin
      log_file = File.open("log/pi.log", "a")
      Logger.new(MultiIO.new(STDOUT, log_file))
    end
  end
end