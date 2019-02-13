class TimeFormat
  TIME_FORMATS = { 'year' => '%Y', 'month'   => '%m', 'day'    => '%d',
                   'hour' => '%H', 'minutes' => '%M', 'second' => '%S' }.freeze

  def initialize(format_string)
    @format_array = format_string.split(",")
  end

  def invalid
    format_array - TIME_FORMATS.keys
  end

  def date_time
    Time.now.strftime(data_time_params)
  end

  private
  attr_reader :format_array

  def data_time_params
    format_array.map { |key| TIME_FORMATS[key] }.compact.join('-')
  end
end
