# frozen_string_literal: true

FactoryBot.define do
  factory :analytic do
    association :link
    session { SecureRandom.hex(10) }
    system_name { 'macOS' }
    browser_name { 'Chrome' }
    browser_version { '121.0.0.0' }
    referer { 'http://example.com/referer' }
    ip { '127.0.0.1' }
    device { 'mac' }
    city { 'São Paulo' }
    country { 'Brazil' }
    region { 'São Paulo' }
    latitude { '-22.8305' }
    longitude { '-21.8305' }
  end
end
