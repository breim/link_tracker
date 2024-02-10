# frozen_string_literal: true

# spec/support/mock_helper.rb

module MockHelper
  def create_browser_mock
    double('Browser',
           platform: double('Platform', name: 'macOS', to_s: 'mac'),
           name: 'Chrome',
           full_version: '121.0.0.0')
  end

  def create_request_mock
    double('ActionDispatch::Request',
           ip: '127.0.0.1',
           referer: 'http://example.com/referer')
  end

  def create_location_mock
    double('Geocoder::Result::Freegeoip',
           country_name: 'Brazil',
           real_region_name: 'São Paulo',
           city_name: 'São Paulo',
           latitude: '-22.8305',
           longitude: '-22.8305')
  end
end
