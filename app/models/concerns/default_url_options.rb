module DefaultUrlOptions

  def default_url_options
  {
    host: host,
    port: port,
  }
  end

private

  def host
    'http://localhost:3000/'
  end

  def port
    587
  end


end
