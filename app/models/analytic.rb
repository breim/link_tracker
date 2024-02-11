# frozen_string_literal: true

class Analytic < ApplicationRecord
  belongs_to :link, counter_cache: true

  self.per_page = 10

  def self.create_record(link, browser, request)
    location = GEO_IP.city(request.ip)
    attributes = extract_attributes(browser, request, location)

    create(attributes.merge(link_id: link&.id))
  end

  def self.retrive_device?(browser)
    browser.platform
  end

  def self.extract_attributes(browser, request, location)
    {
      system_name: browser.platform.name.to_s,
      browser_name: browser.name.to_s,
      browser_version: browser.full_version.to_s,
      referer: request.referer,
      country: location&.country_name,
      region: location&.real_region_name,
      city: location&.city_name,
      latitude: location&.latitude,
      longitude: location&.longitude,
      ip: request.ip,
      device: retrive_device?(browser)
    }
  end
end
