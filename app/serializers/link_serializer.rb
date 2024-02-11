# frozen_string_literal: true

class LinkSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :short_url, :token, :analytics_count, :updated_at, :created_at

  def short_url
    ENV.fetch('rails_default_url', nil).to_s + object.token
  end
end
