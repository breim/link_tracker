# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Analytic, type: :model do
  describe 'create_record' do
    let(:link) { create(:link) }
    let(:browser_mock) { create_browser_mock }
    let(:request_mock) { create_request_mock }
    let(:location_mock) { create_location_mock }

    before(:each) do
      allow(GEO_IP).to receive(:city).with(request_mock.ip).and_return(location_mock)
    end

    it 'creates an Analytic record with correct attributes' do
      expect do
        described_class.create_record(link, browser_mock, request_mock)
      end.to change(Analytic, :count).by(1)

      analytic = Analytic.last

      expect(analytic.link).to eq(link)
      expect(analytic.system_name).to eq('macOS')
      expect(analytic.browser_name).to eq('Chrome')
      expect(analytic.browser_version).to eq('121.0.0.0')
      expect(analytic.referer).to eq('http://example.com/referer')
      expect(analytic.country).to eq('Brazil')
      expect(analytic.region).to eq('São Paulo')
      expect(analytic.city).to eq('São Paulo')
      expect(analytic.latitude).to eq('-22.8305')
      expect(analytic.longitude).to eq('-22.8305')
      expect(analytic.ip).to eq('127.0.0.1')
      expect(analytic.device).to eq('mac')
    end
  end
end
