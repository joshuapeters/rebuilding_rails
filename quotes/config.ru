# require this to run our app
require_relative 'config/app'

# because we've overridden Object#const_missing to find any unrequired controllers 
# and to require them, we can do this so that it iterates through every controller 
# file and requires them automatically.
$LOAD_PATH << "#{__dir__}/app"

run Quotes::App.new