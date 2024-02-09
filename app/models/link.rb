# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :analytics, dependent: :destroy
end
