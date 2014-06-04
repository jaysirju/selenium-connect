# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'Appium', selenium: true do

  it 'should work correctly with a configuration file' do
    opts = {
      log: File.join('build', 'tmp'),
      host: 'appium',
      sauce_username: 'testing_arrgyle',
      sauce_api_key: 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a',
      platformName: 'ios',
      deviceName: 'iPhone Simulator',
      appium_version: '1',
      app: 'test.zip'
    }
    config = SeleniumConnect::Configuration.new opts
    @sc = SeleniumConnect.start config
  end

  it 'should work correctly with a configuration file without credentials' do
    opts = {
      log: File.join('build', 'tmp'),
      host: 'appium',
      platformName: 'ios',
      deviceName: 'iPhone Simulator',
      app: 'test.zip'
    }
    config = SeleniumConnect::Configuration.new opts
    @sc = SeleniumConnect.start config
  end

  after(:each) do
    @sc.finish
  end
end
