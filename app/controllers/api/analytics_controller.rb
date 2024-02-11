# frozen_string_literal: true

module Api
  class AnalyticsController < ApplicationController
    respond_to :json

    def index
      @analytics = Analytic.where(link_id: params[:link_id]).paginate(page: params[:page]).order(created_at: :asc)
      respond_with(@analytics)
    end
  end
end
