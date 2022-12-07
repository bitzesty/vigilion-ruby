# Vigilion

This Ruby gem is for integrating with the [Vigilion Anti-Virus & Malware file scanning service](https://github.com/bitzesty/vigilion-scanner).

If you are using Rails, you should use our [Rails gem](
https://github.com/vigilion/vigilion-rails), which includes
integration with Active Record and Action Controller.

## Installation

Add vigilion to your `Gemfile` and then run `bundle install`

`gem 'vigilion'`

or install it by hand

`gem install vigilion`

This gem uses faraday as HTTP middleware, so you may use any HTTP
backend you want, `Net:HTTP` is the default.

## Configuration

You need to configure the client before making any API requests e.g. in an initializer.

```
Vigilion.configure do |config|
  config.access_key_id = ENV['VIGILION_API_KEY']
  config.secret_access_key = ENV['VIGILION_API_SECRET']
end
```

# License

Vigilion scanner is Copyright © 2021 Bit Zesty. It is free
software, and may be redistributed under the terms specified in the
[LICENSE.md] file.

[LICENSE.md]: https://github.com/vigilion/vigilion-ruby/blob/master/LICENSE.md


# About Bit Zesty

![Bit Zesty](https://bitzesty.com/wp-content/uploads/2017/01/logo_dark.png)

Vigilion malware scanner is maintained by Bit Zesty Limited.
The names and logos for Bit Zesty are trademarks of Bit Zesty Limited.

See [our other projects](https://bitzesty.com/client-stories/) or
[hire us](https://bitzesty.com/contact/) to design, develop, and support your product or service.
