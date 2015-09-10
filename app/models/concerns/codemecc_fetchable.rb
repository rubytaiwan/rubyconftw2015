require 'active_support/concern'
module CodemeccFetchable
  extend ActiveSupport::Concern
  AUTH_HEADER = Settings.codemecc.auth_header
  class_methods do
    def fetch_codemecc_api(url)
      remote_result = JSON.parse(open(url, "Authorization" => AUTH_HEADER).read)
      if block_given?
        yield(remote_result)
      else
        remote_result
      end
    end
  end
end
