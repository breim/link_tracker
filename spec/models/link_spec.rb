# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid with a original_url present' do
    link = build(:link)
    expect(link).to be_valid
  end

  it 'is not valid without a original_url' do
    link = build(:link, original_url: nil)
    expect(link).not_to be_valid
    expect(link.errors.messages[:original_url]).to include("can't be blank")
  end

  it 'generates a token before creation' do
    link = create(:link, token: nil)
    expect(link.token).not_to be_nil
  end

  it 'validates the original_url format' do
    link = build(:link, original_url: 'not-a-valid-url')
    expect(link).not_to be_valid
    expect(link.errors.messages[:original_url]).to include('is not a valid URL')
  end
end
