# Vigilion
Vigilion is a SaaS that allows asynchronously scanning files
detecting trojans, viruses, malware & other malicious threats
and sends back the results to your app.

This is a Ruby gem to allow client applications to integrate to
Vigilion Scanning Service.

If you use Rails, you probably want to take a look at
https://github.com/vigilion/vigilion-rails which includes
integration with Active Records and Action Controllers.


## Installation

To use it in your project, add following line to your Gemfile

`gem vigilion`

and then run

`bundle`

or install it by hand

`gem install vigilion`

It uses faraday as HTTP middleware so you may use any HTTP
backend you want. Net:HTTP is default one.

(TODO: add configuration option to change HTTP request)

## Usage

`Vigilion` gem expose the following methods:

* `Vigilion.scan_url(resource_identifier, url)`
Sends a request to Vigilion Server to enqueue the URL of the
file to be scanned.
It requires two parameters:
** the resource identifier, it could be any string and it
represents the ID of the file in your system.
** an absolute URL that Vigilion scanner will use to download
the file before scanning.

* `Vigilion.scan_path(resource_identifier, local_path)`
This method takes a local file and sends a request to Vigilion
Server to enqueue the file to be scanned.
It requires two parameters:
** the resource identifier, it could be any string and it
represents the ID of the file in your system.
** the local path to the file. It will be sent using HTTP POST
and stored temporaly in Vigilion servers.

* `Vigilion.configure(&block)`
Configures the credentials and other configuration to connect with
the server.
You need to call this method before calling any other.
The minimum configuration should be:
```
Vigilion.configure do |config|
  config.access_key_id = 'xxxxxxx'
  config.secret_access_key = 'xxxxxxx'
end
```
To obtain your credentials, please visit the Vigilion site.

* `Vigilion.check_status(identifier)`
Accepts job UUID as an argument and returns information about
job status.

(c) 2015 BitZesty Ltd.

