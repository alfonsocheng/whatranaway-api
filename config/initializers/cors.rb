# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    # origins 'https://www.whatranaway.com'
    resource '*',
      headers: :any,
      methods: %i(get)# post put patch delete options head)
  end
  allow do
    # origins 'http://localhost:3000'
    origins 'https://www.whatranaway.com'
    resource '*',
      headers: :any,
      methods: %i(get)# post put patch delete options head)
  end
end
