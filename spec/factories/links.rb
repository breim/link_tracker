# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    original_url { 'http://example.com' }
    short_url { '' }
    token { SecureRandom.hex(10) }
    analytics_count { 0 }
  end
end
