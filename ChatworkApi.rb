require 'uri'
require 'net/http'
require 'yaml'

class ChatworkApi
  $config = YAML.load_file 'config.yml'

  def send_message(msg)
    url = $config['ENDPOINT_BASE_URL']
    url << $config['API_VERSION']
    url << '/rooms/'
    url << $config['ROOM_ID'].to_s
    url << '/messages'

    uri = URI.parse(url)

    request = Net::HTTP::Post.new(uri.request_uri)
    request['X-ChatWorkToken'] = $config['CHATWORK_API_TOKEN']

    query_hash = {"body" => msg}
    request.set_form_data(query_hash)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    response = https.request(request);
  end

  def create_task(msg, to_ids)
    url = $config['ENDPOINT_BASE_URL']
    url << $config['API_VERSION']
    url << '/rooms/'
    url << $config['ROOM_ID'].to_s
    url << '/tasks'

    uri = URI.parse(url)

    request = Net::HTTP::Post.new(uri.request_uri)
    request['X-ChatWorkToken'] = $config['CHATWORK_API_TOKEN']

    query_hash = {"body" => msg, "to_ids" => to_ids}
    request.set_form_data(query_hash)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    response = https.request(request);
  end
end
