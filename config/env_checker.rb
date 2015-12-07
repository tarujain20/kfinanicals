# This is a way of loading any secrets from a file in dev,
# and making sure that they are all appropriately defined
# in environment variables before the app loads.
#
# In environment.rb:
#   EnvChecker.new( %W[SECRET_ONE SECRET_TWO] ).read!
#
# In config/env_secrets.rb:
# ENV['SECRET_ONE'] = 'shhh'
# ENV['SECRET_TWO'] = 'topsecret'
#
class EnvChecker
  def initialize(required_variables)
    @required_variables = required_variables
  end
  
  def read
    if File.exists?(filename)
      STDERR.puts "loading secrets from #{filename}"
      load(filename)
      STDERR.puts "WARNING: found secrets file #{filename} in production" if
        Rails.env.production?
    end
  end

  def check!
    undefined_variables = @required_variables.select {|v| !ENV.has_key?(v) }
    unless undefined_variables.empty?
      message = "The following required environment variables are undefined: \n\t" +
                "#{undefined_variables.join(', ')} - " +
                "add them to #{filename} or export to your environment"
      abort message
    end
  end
  
  def read!
    read
    check!
  end

  private
  def filename
    File.join(Rails.root, 'config', 'env_secrets.rb')
  end
end
