module TitaniumHip
  class CLI < ::Thor
    include ::Thor::Actions

    def message_room(room_name, message, options={})
      puts "messaging room #{room_name} with message #{message}"
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

