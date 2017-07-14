require 'rails_helper'

RSpec.feature "Add new channel", type: :feature do
  around do |example|
    VCR.use_cassette :fetch_channel do
      example.run
    end
  end

  it 'should display form' do
    visit new_channel_url
    expect(page).to have_text 'New channel'

    fill_in 'Channel URL', with: 'https://www.youtube.com/channel/UCX0nHcqZWDSsAPog-LXdP7A'

    click_on 'Convert to podcast'

    expect(page).to have_content '/channels/UCX0nHcqZWDSsAPog-LXdP7A.atom'
  end
end
