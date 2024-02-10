# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :analytics, dependent: :destroy
  validates :original_url, presence: true

  before_create :build_token

  private

  def build_token
    self.token = SecureRandom.urlsafe_base64(5)
  end
end
