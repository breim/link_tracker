# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkSerializer, type: :serializer do
  let(:link) { create(:link) }
  let(:serializer) { described_class.new(link) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  subject { JSON.parse(serialization.to_json) }

  it 'includes the expected attributes' do
    expect(subject.keys).to contain_exactly(
      'id', 'original_url', 'short_url', 'token', 'analytics_count', 'updated_at', 'created_at'
    )
  end

  it 'generates short_url correctly' do
    expect(subject['short_url']).to eq(ENV.fetch('rails_default_url', nil).to_s + link.token)
  end
end
