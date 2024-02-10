# frozen_string_literal: true

class RedirectsController < ApplicationController
  before_action :set_link, only: :show

  def show
    return render json: { error: 'Link not found' }, status: :not_found if @link.blank?

    redirect_to @link.original_url, allow_other_host: true, status: :moved_permanently
  end

  private

  def set_link
    @link = Link.find_by(token: params[:token])
    Analytic.create_record(@link, browser, request) if @link.present?
  end
end
