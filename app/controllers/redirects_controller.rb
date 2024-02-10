# frozen_string_literal: true

class RedirectsController < ApplicationController
  before_action :set_link, only: :show

  def show
    redirect_to @link.original_url, allow_other_host: true if @link.present?
  end

  private

  def set_link
    @link = Link.find_by(token: params[:token])
  end
end
