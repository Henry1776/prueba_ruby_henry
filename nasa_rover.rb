require "uri"
require "net/http"
require "json"

def request(url,token = nil)
    url = URI ("#{url}&api_key=#{token}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    data = JSON.parse(response.read_body)
end

def build_nasa_rover(rover)
    File.open('nasa_examen.html','w') do |file|
        rover["photos"].each do |photo|
            file.puts "<img src='#{photo["img_src"]}'>"
        end
    end      
end    
 
nasa_array = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','epQ20Ei7uJzHb9HgBWMdZFOWqFYUVQiYayR9Bcl3')
build_nasa_rover(nasa_array)


"<html>
<head>
</head>
<body>
<ul>
<li></li>
<li></li>
</ul>
</body>

</html>"