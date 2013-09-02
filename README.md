# CloopenRest

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'cloopen_rest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloopen_rest

## Usage

### Setup Work
```ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'cloopen_rest'

account_sid = 'your_account_sid'
auth_token = 'your_auth_token'
app_id = 'your_app_id'

@client = Cloopen::REST::Client.new(account_sid, auth_token, app_id)
@account = client.account
```

### Send a SMS ([official doc](http://42.121.15.9/index.php/短信))
```ruby
message = @account.sms.messages.create(
  to: 'your_phone_number',
  body: 'text sms from gem',
  sub_account_sid: 'your_sub_account_sid')

# Get the resquest response and status
message.response
message.response.body
message.response.status
message.response.status_code
```

### Get info of the account ([official doc](http://42.121.15.9/index.php/账户信息查询))
```ruby
info = @account.account_info.get

info.response
```

### Make a landing call ([official doc](http://42.121.15.9/index.php/营销外呼))
```ruby
landing_call = @account.calls.landing_calls.create(
  to: 'your_phone_number',
  media_txt: 'Hello, from Gem.',
  play_times: 3)

landing_call.response
```

### Create a sub_account ([official doc](http://42.121.15.9/index.php/子账户))
```ruby
sub_account = @account.sub_accounts.create friendly_name: 'awesome_name'

sub_account.response
```

## TODO
* Test
* More APIs

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

Inspired by [twilio-ruby](https://github.com/twilio/twilio-ruby)