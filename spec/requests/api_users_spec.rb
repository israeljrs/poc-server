require 'rails_helper'

describe 'get all user api', :type => :request do
  before { get '/api/v1/users' }

  it 'returns all users' do
    expect(JSON.parse(response.body)['status']).to eq('SUCCESS')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
