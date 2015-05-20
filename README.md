
# Baidumap
[Baidu Map(百度地图) API in Ruby](http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-placeapi)




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baidumap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidumap




## Usage

### Initialize

```ruby
# [ak申请](http://lbsyun.baidu.com/apiconsole/key?application=key)

Baidumap.ak = "aaaaaaaaaaaaaaaaaa"

# or

Baidumap.setup {@ak "aaaaaaaaaaaaaaaaaa" }
```




### Example

[API wiki](http://developer.baidu.com/map/index.php?title=webapi)

Please note that params shouldn't include `output: 'json'` or `output: 'xml'`, which will be added by gem automatically and the result is always a hash.


```ruby
# place API
Baidumap.place_search(query: "九亭", region: "上海", scope: '1')

Baidumap.place_detail(uid:  "5508504d0319eecac6f0259a", scope: '2')

Baidumap.place_detail(uids: "5508504d0319eecac6f0259a, 104274a315f7134fc3f1cfde", output: 'json', scope: '2')    # NOTE and TODO: there is a bug that "," in uids's value will be translated, so this method is not usable currently.


# Place Suggestion API
Baidumap.place_suggestion(query: "九亭", region: "全国")


# Geocoding API
Baidumap.geocoder(address: "九亭")

Baidumap.geocoder(location: '121.33428124857, 31.13491723367')     # NOTE and TODO: there is a bug that "," in uids's value will be translated, so this method is not usable currently.


# IP定位API
Baidumap.location(ip: "115.172.82.212", coor: "bd09ll")
```




### Result Debug

If the resturn status from Baidu API is not "0", then there is an error. To debug it, you always can attatch a block `{ |debug| debug.inspect }` to show the original url requested from this gem to Baidu just like this:

`Baidumap.place_detail(uids: [ "5508504d0319eecac6f0259a, 104274a315f7134fc3f1cfde" ], output: 'json', scope: '2') { |deug| debug.inspect } `

You can show your ak value used by this gem through this code `Baidumap.ak`.






## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).




## Contributing

1. Fork it ( https://github.com/yanyingwang/baidumap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
