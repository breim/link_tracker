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
    end

    context 'when the link is not found' do
      it 'returns a 404 not found response' do
        get :show, params: { token: 'invalidtoken' }
        expect(response).to have_http_status(:not_found)
        expect(response.parsed_body).to eq({ 'error' => 'Link not found' })
      end
    end
  end
end
