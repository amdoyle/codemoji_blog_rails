module DefaultUrlOptions

  def default_url_options
  {
    host: host,
    port: port,
  }
  end

private

  def host
    'https://ancient-island-27279.herokuapp.com/'
  end

  def port
    587
  end


end
