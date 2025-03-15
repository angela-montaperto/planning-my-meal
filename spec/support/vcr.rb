VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
  c.allow_http_connections_when_no_cassette = false
  c.configure_rspec_metadata!
  # c.ignore_localhost = true
  c.ignore_request do |request|
    uri = URI(request.uri)
    (
      [ "localhost", "127.0.0.1", "0.0.0.0", "chromedriver.storage.googleapis.com" ].include?(uri.host) &&
      (uri.path == "/__identify__" || uri.path =~ %r{/solr/} || uri.path =~ /session/)
    ) || IGNORED_URLS.include?(uri.host)
  end
end
