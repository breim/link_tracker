# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { build(:link) }

  it 'is valid with a original_url present' do
    expect(link).to be_valid
  end

  it 'is not valid if the token is not unique' do
    link = create(:link)
    new_link = build(:link, token: link.token)

    expect(new_link.valid?).to be_falsey
    expect(new_link.errors.messages[:token]).to include('has already been taken')
  end

  it 'is not valid without a original_url' do
    link.original_url = nil
    expect(link).not_to be_valid
    expect(link.errors.messages[:original_url]).to include("can't be blank")
  end

  it 'generates a token before creation' do
    expect(link.token).not_to be_nil
  end

  it 'validates the original_url incorrect format' do
    link.original_url = 'not-a-valid-url'
    expect(link).not_to be_valid
    expect(link.errors.messages[:original_url]).to include('is not a valid URL')
  end

  it 'validates the original_url correct format' do
    link.original_url = 'http://localhost:3000/'
    expect(link).to be_valid
  end
end
