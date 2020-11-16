[![Build Status](https://travis-ci.com/ozone4real/sincli.svg?branch=master)](https://travis-ci.com/ozone4real/sincli)
# Sincli

Command line tool for initializing a new modular Sinatra application with default configurations. This includes the basic things that are needed to build any kind of application with Sinatra. The application is setup with a structure that is similar to Rails. The goal of this project is to help reduce the time spent in setting up and configuring your new Sinatra application.

## Installation

Run this on your command line:

    $ gem install sincli

## Usage

Initialize a new Sinatra application:

```
$ sincli new "APP_NAME"
```

To view the list of available options run:

```
$ sincli help new
```

## Some of the configurations set up

- Rack
- Assets Pipeline (with Sprockets)
- Puma (if 'puma' is passed as the server option)
- RSpec
- Sinatra extensions
- Internationalization (with 1i8n)
- Database
- CORS (if the --api-only flag is passed)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ozone4real/sincli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ozone4real/sincli/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sincli project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ozone4reak/sincli/blob/master/CODE_OF_CONDUCT.md).
