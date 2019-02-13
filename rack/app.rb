class App
  def call(env)
    request  = Rack::Request.new(env)

    if request.path_info == "/time"
      time_response(request)
    else
      response(404, "The requested resource is not available")
    end
  end

  private

  def response(status, body)
    [status,  { 'Content-Type' => 'text/plain' }, [body]]
  end

  def time_response(request)
    format_string = request.params['format']

    if format_string
      check_format_response(format_string)
    else
      response(404, "Format not found")
    end
  end

  def check_format_response(format_string)
    time_format = TimeFormat.new(format_string)

    if time_format.invalid.any?
      response(400, "Unknown time format #{time_format.invalid}\n")
    else
      response(200, "#{time_format.date_time}\n")
    end
  end
end
