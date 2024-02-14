# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :analytics, dependent: :destroy
  validates :original_url, presence: true
  validates :token, uniqueness: true
  validate :validate_url

  self.per_page = 10

  before_create :build_token

  private

  def build_token
    self.token = SecureRandom.urlsafe_base64(5)
  end

  def validate_url
    uri = URI.parse(original_url)
    is_valid = uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)

    errors.add(:original_url, 'is not a valid URL') unless is_valid
  rescue URI::InvalidURIError
    errors.add(:original_url, 'is not a valid URL')
  end
end
