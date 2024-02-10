# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::LinksController, type: :controller do
  let!(:link) { create(:link) }
  let(:invalid_attributes) { { original_url: '' } }

  describe 'GET #index' do
    it 'returns all links' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a specific link' do
      get :show, params: { id: link.id }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { original_url: 'http://example.com' } }

    it 'creates a new Link with valid params' do
      expect do
        post :create, params: { link: valid_attributes }, format: :json
      end.to change(Link, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'returns a failure response with invalid params' do
      post :create, params: { link: invalid_attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    let(:new_attributes) { { original_url: 'https://example.com' } }

    it 'updates the requested link' do
      patch :update, params: { id: link.id, link: new_attributes }, format: :json
      link.reload
      expect(link.original_url).to eq('https://example.com')
      expect(response).to have_http_status(:no_content)
    end

    it 'returns a failure response with invalid params' do
      post :update, params: { id: link.id, link: invalid_attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested link' do
      expect do
        delete :destroy, params: { id: link.id }, format: :json
      end.to change(Link, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
