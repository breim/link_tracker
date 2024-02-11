# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedirectsController, type: :controller do
  describe 'GET #show' do
    context 'when the link is found' do
      let!(:link) { create(:link, original_url: 'http://example.com') }

      it 'redirects to the original URL' do
        get :show, params: { token: link.token }

        expect(response).to redirect_to(link.original_url)
        expect(response.status).to eq 301
      end

      it 'creates an Analytic record' do
        link = create(:link, token: 'valid_token')

        expect do
          get :show, params: { token: link.token }
        end.to change(Analytic, :count).by(1)

        new_analytic = Analytic.last
        expect(new_analytic.link_id).to eq(link.id)
      end
    end

    context 'when the link does not exist' do
      it 'ActiveRecord::RecordNotFound to returns a JSON error message' do
        get :show, params: { token: 'invalid_token' }

        expect(response).to have_http_status(:not_found)
        expect(response.parsed_body).to eq({ 'error' => 'record not found' })
      end
    end
  end
end
