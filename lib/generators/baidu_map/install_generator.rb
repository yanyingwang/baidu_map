require 'rails/generators'

module BaiduMap
  class InstallGenerator < Rails::Generators::Base

    def install
      copy_file('initialize.rb', 'config/initializers/baidu_map.rb')
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'config')
    end
  end
end
