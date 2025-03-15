# spec/support/api_helpers.rb
require 'digest'

module FixturesHelpers
  def fixture_file_url(fixture_path)
    fixture_path = Rails.root.join("spec", "fixtures", "files", fixture_path)
    "file://#{fixture_path.expand_path}"
  end

  def fixture_file_base64(fixture_path)
    Base64.encode64(Rails.root.join("spec", "fixtures", "files", fixture_path).read)
  end

  def fixture_file_content(fixture_path)
    Rails.root.join("spec", "fixtures", "files", fixture_path).read
  end

  def fixture_file_md5(fixture_path)
    Digest::MD5.hexdigest(Rails.root.join("spec", "fixtures", "files", fixture_path).read)
  end
end
