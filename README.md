# GeoLocator

This project provides a simple REST web service which returns geolocation information for a given IP address. The service loads location information from Maxminds GeoLite2 or GeoIP2 City database.

## Usage

The API was created with Swagger Documentation, hence, the API can be queries like so, which then returrns the latitutde and longitude of the given IP address.

Swagger documentation is available at the / index

![Swagger Docs](/assets/swagger.png)


The API accepts a GET request which accepts the IP address as a parameter.

![Get API](/assets/getRequest.png)

The API then queries the database and returns the latitude and longitude of the given IP address.

![Success result](/assets/requestSuccess.png)

# Deployment

The API is deployed within a container, which is running on a Kubernetes cluster. IngreeController used is nginx and can be deployed on prem by executing the following command - 

``` bash
kubectl apply -f kubernetes-deployment.yaml
```
