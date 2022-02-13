import geoip2.database
from flask import Flask
from flask_restplus import Resource, Api
app = Flask(__name__)
api = Api(app)
ns = api.namespace('/', description='Enter the IP address to get the location')

@ns.route('/<string:ip>')
class geoip(Resource):
    def get(self, ip):        
        with geoip2.database.Reader('GeoLite2-City.mmdb') as reader:
            response = reader.city(ip)
            return {'latitude': response.location.latitude, 'longitude': response.location.longitude}

if __name__ == '__main__':
    app.run(debug=False)