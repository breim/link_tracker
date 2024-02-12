# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnalyticSerializer, type: :serializer do
  let(:analytic) { create(:analytic) }
  let(:serializer) { described_class.new(analytic) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  subject { JSON.parse(serialization.to_json) }

  it 'includes the expected attributes' do
    expect(subject.keys).to contain_exactly(
      'id', 'system_name', 'browser_name', 'browser_version', 'referer', 'country', 'region', 'city', 'latitude', 'longitude', 'ip', 'device', 'created_at'
    )
  end
end
