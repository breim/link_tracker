# frozen_string_literal: true

class RedirectsController < ApplicationController
  before_action :set_link, only: :show

  def show
    create_analytic(@link)
    redirect_to @link.original_url, allow_other_host: true, status: :moved_permanently
  end

  private

  def set_link
    @link = Link.find_by!(token: params[:token])
  end

  def create_analytic(link)
    Analytic.create_record(link, browser, request)
  end
end
