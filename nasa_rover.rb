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
    end      
end    

nasa_array = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','epQ20Ei7uJzHb9HgBWMdZFOWqFYUVQiYayR9Bcl3')
puts build_nasa_rover(nasa_array)


"<html>
            <head></head>
            <body>
            <ul>
            <li>"rover.each do |photo|
                file.puts "<img src='#{photo["photos"]["img_src"]}'>" end"</li>
            <li></li>
                </ul>
                </body>
                </html>"

string_html = '''<!doctype html>
<html lang="es">
  <head></head>
  <body>
    <h1>Pagina NASA</h1>
    '''
dato_tmp = "NASA"
string_html += '<ul>' + dato_tmp + '</ul>'
string_html += '''
</body>

</html>
'''
fHTML = File.open("nasa_examen.html","w")
fHTML.write(string_html)
fHTML.close