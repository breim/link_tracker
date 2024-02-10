# frozen_string_literal: true

class LinkSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :short_url, :token, :analytics_count, :updated_at, :created_at
end
