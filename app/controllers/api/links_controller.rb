# frozen_string_literal: true

module Api
  class LinksController < ApplicationController
    respond_to :json

    def index
      @links = Link.paginate(page: params[:page]).order(created_at: :asc)
      respond_with(@links)
    end

    def show
      @link = Link.find(params[:id])
      respond_with(@link)
    end

    def create
      @link = Link.new(link_params)
      if @link.save
        respond_with(@link, location: api_link_url(@link))
      else
        respond_with(@link.errors, status: :unprocessable_entity)
      end
    end

    def update
      @link = Link.find(params[:id])
      if @link.update(link_params)
        respond_with(@link)
      else
        respond_with(@link.errors, status: :unprocessable_entity)
      end
    end

    def destroy
      @link = Link.find(params[:id])
      @link.destroy
      respond_with(@link)
    end

    private

    def link_params
      params.require(:link).permit(:original_url)
    end
  end
end
