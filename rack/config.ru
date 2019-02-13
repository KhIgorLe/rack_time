require_relative 'middleware/runtime'
require_relative 'middleware/loger'
require_relative 'middleware/time_format'
require_relative 'app'

use AppLogger, logdev: File.expand_path('log/app.log', __dir__)
use RunTime
run App.new
