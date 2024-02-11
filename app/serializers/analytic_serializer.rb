# frozen_string_literal: true

class AnalyticSerializer < ActiveModel::Serializer
  attributes :id, :system_name, :browser_name, :browser_version, :referer, :country, :region, :city, :latitude, :longitude, :ip, :device, :created_at
end
