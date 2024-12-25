Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins 'http://localhost:3000' # Specifies which domains can access your API
        resource '*',                   # Applies to all routes
        headers: :any,               # Allows any headers
        methods: [:get, :post, :put, :patch, :delete, :options, :head], # Allowed HTTP methods
        credentials: true            # Allows sending cookies and authentication headers
    end
end