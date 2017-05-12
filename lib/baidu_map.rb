# -*- coding: utf-8 -*-
require "baidu_map/version"
require 'eat'
require 'json'


module BaiduMap
  class << self
    alias_method :setup, :instance_eval
    attr_accessor :ak


    private

    def method_missing(method, **params)
      endpoint = 'http://api.map.baidu.com/'
      method_str = method.to_s

      method_url = case method_str
                   when 'geoconv', 'direction'       # 坐标转换API,  # Direction API
                     method_str + "/v1/?"
                   when 'location'                   # IP定位API
                     method_str + "/ip?"
                   when /^direction_.*/              # Route Martrix API
                     method_str.sub('_', "/v2/") + '?'
                   when 'geocoder'                   # Geocoding API
                     method_str + '/v2/?'
                   else                              #  /^place_.*/  --- Place API and Place Suggestion API
                     method_str.sub('_', "/v2/") + '?'
                   end

      full_url = endpoint + method_url + URI.encode_www_form(params.merge(ak: @ak, output: 'json'))

      block_given? ? yield(full_url) : JSON.parse(eat full_url)
    end

  end
end


