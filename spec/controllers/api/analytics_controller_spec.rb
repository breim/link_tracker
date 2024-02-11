# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::AnalyticsController, type: :controller do
  describe 'GET #index' do
    let!(:link) { create(:link) }
    let!(:analytics) { create_list(:analytic, 30, link: link) }

    context 'when request without pagination param' do
      it 'returns analytics for the specified link_id' do
        get :index, params: { link_id: link.id }, format: :json
        request_response = response.parsed_body

        expect(response).to have_http_status(:ok)
        expect(request_response.size).to eq(10)
      end
    end

    context 'when request with pagination param' do
      it 'returns analytics for the specified link_id paginated' do
        get :index, params: { link_id: link.id, page: 1 }, format: :json
        request_response = response.parsed_body

        expect(response).to have_http_status(:ok)
        expect(request_response.size).to eq(10)
      end
    end
  end
end
