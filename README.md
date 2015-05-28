# vs-ruby
This is ruby gem for communication with Virus Scanner API.

## Installation

To use it in your project, add following line to your Gemfile

`gem vs-ruby`

and then run

`bundle`

or install it by hand

`gem install vs-ruby`

It uses faraday as HTTP middleware so you may use any HTTP backend you want. Net:HTTP is default one.

(TODO: add configuration option to change HTTP request)

## Usage

`VirusScanner::File` class has two methods:

 * `check_from_url` which accepts URL to remote file as argument and returns scan job status
 * `check_status` which accepts job UUID as argument and returns information about job status

(c) 2015 BitZesty Ltd.

