# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    original_url { 'http://example.com' }
    token { SecureRandom.hex(10) }
    analytics_count { 0 }
  end
end
