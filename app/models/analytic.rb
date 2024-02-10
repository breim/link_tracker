# frozen_string_literal: true

class Analytic < ApplicationRecord
  belongs_to :link, counter_cache: true
end
