require 'hipchat'
module TitaniumHip
  class CLI < ::Thor
    include ::Thor::Actions

    desc('message_room ROOMNAME MESSAGE', 'Send a message to a room')
    def message_room(room_name, message, options={})
      room_options = hipchat_options['rooms'].find {|key,val| key == room_name}
      hipchat_client = client(room_options.last)
      hipchat_client[room_name].send('ThatsNotMyName', message, notify: true)
    end

    desc 'server_mode', "Put Titanium Hip in server mode. Makes Titanium Hip listen for incoming connections. Use netcat or something similar to send commands"
    option :port, type: :numeric, default: 7878, aliases: %w(-p), desc: 'Port to bind Titanium Hip server'
    option :host, type: :string,  default: '127.0.0.1', aliases: %w(-h), desc: 'Host to bind Titanium Hip server'
    def server_mode
      "STARTING SERVER MODE!!!"
    end

    no_tasks do
      def hipchat_options
        yaml_file = File.expand_path('config/hipchat.yml')
        YAML.load_file(yaml_file)
      end

      def client(room_api_key)
        HipChat::Client.new(room_api_key, api_version: 'v2')
      end
    end
  end
end
# api_key = 'adcW2us4r1dANOr3KPs5e6sxgL4N8MlDCqzx9TCy'
# message = {
#   notify: true,
#   message_format: 'text',
#   color: 'purple',
#   message: "@TFiddy sure thing"
# }
# 
# headers = {
#   'Content-Type' =>'application/json',
#   'Authorization' => "Bearer #{api_key}"
# }
# uri = URI.parse('https://api.hipchat.com/v2/room/Team%20Doge/notification')
# https = Net::HTTP.new(uri.host)
# req = Net::HTTP::Post.new(uri.path, initheader = headers)
# req.body = message.to_json
# res = https.request(req)
# puts "Response #{res.code} #{res.message}: #{res.body}"

