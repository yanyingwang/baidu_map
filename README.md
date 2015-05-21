
# BaiduMap
[Baidu Map(百度地图) API](http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-placeapi) wrapper in Ruby




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baidu_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu_map




## Usage

### Initialize

[ak申请](http://lbsyun.baidu.com/apiconsole/key?application=key)

```ruby
BaiduMap.ak = "aaaaaaaaaaaaaaaaaa"

# or

BaiduMap.setup { @ak = "aaaaaaaaaaaaaaaaaa" }
```


### Initialize for Rails

run command:
```shell
$ rails generate baidu_map:install
```
and then add your ak to file `config/initializers/baidu_map.rb`.




### Example

[API wiki](http://developer.baidu.com/map/index.php?title=webapi)

Please note that params shouldn't including `output: 'json'` or `output: 'xml'`, because which will be added by gem automatically and the result is always a hash.


```ruby
# Place API
BaiduMap.place_search(query: "九亭", region: "上海", scope: '1')

BaiduMap.place_detail(uid:  "5508504d0319eecac6f0259a", scope: '2')

BaiduMap.place_detail(uids: "5508504d0319eecac6f0259a,8ee4560cf91d160e6cc02cd7", output: 'json', scope: '2')


# Place Suggestion API
BaiduMap.place_suggestion(query: "九亭", region: "全国")


# Geocoding API
BaiduMap.geocoder(address: "九亭")

BaiduMap.geocoder(location: '39.983424,116.322987')


# IP定位API
BaiduMap.location(ip: "115.172.82.212", coor: "bd09ll")
```




### Result Debug: show original request url

If the return status of result from Baidu API is not "0", then there is an error. To debug it, you always can attatch a block `{ |debug| debug.inspect }` to show the original url requested from this gem to Baidu just like this:

```ruby
`BaiduMap.place_detail(uids: [ "5508504d0319eecac6f0259a, 104274a315f7134fc3f1cfde" ], output: 'json', scope: '2') { |deug| debug.inspect }
```

You can show your ak value used by this gem through this code:
```ruby
BaiduMap.ak
```






## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).




## Contributing

1. Fork it ( https://github.com/yanyingwang/baidu_map/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
