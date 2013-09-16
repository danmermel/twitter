require 'net/http'
require 'net/https'
require 'json'

uri = URI.parse("https://api.twitter.com")
http = Net::HTTP.new(uri.host, uri.port)  # new net http object
http.use_ssl = true 
http.verify_mode = OpenSSL::SSL::VERIFY_NONE  #don't verify the SSL certificate
#now create http post object
request = Net::HTTP::Post.new("/oauth2/token", initheader = {"Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8", 
                                                             "Authorization" => 'Basic aXpVZGNlYjdtTDdYSTlhUktTR3ZkQTpzQ09lcWVWMUl3TlJ2NlNHYklNbnRRR3lzem5PcnRQMVVtcUpNdFFRN3c='
                                                             })
request.body = "grant_type=client_credentials"
response = http.request(request)   # make the call
# puts response.body  # this will show you the body
res_parsed =JSON.parse(response.body)  # parse the response
my_token =  res_parsed["access_token"] # grab the access token 

# now you can go and make the ACTUAL GET request

request2 = Net::HTTP::Get.new("/1.1/statuses/user_timeline.json?screen_name=desktopdan&count=10", initheader = {"Authorization" => "Bearer #{my_token}"})
response2 = http.request(request2)
File.open('twitter.txt', 'w') do |f| 
  f.write(response2.body)
end
parsed_response = JSON.parse(response2.body)
parsed_response.each do |x|    # loop through data array
   puts x["text"]
end 

