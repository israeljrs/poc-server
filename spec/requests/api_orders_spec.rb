require 'rails_helper'

describe "post params user api", :type => :request do

  before do
    @user = build(:user)
    post '/api/v1/users', params: { nome: @user.nome, cpf: @user.cpf, email: @user.email }
  end

  it 'returns user' do
    expect(JSON.parse(response.body)['status']).to eq('SUCCESS')
  end

  it 'returns post nome' do
    expect(JSON.parse(response.body)['data']['nome']).to eq(@user.nome)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns orders success' do
    user = JSON.parse(response.body)['data']
    get "/api/v1/users/#{user['id']}/orders"
    expect(JSON.parse(response.body)['status']).to eq('SUCCESS')
  end

  it 'post orders' do
    @user = JSON.parse(response.body)['data']
    order = build(:order, user_id: @user['id'])
    post "/api/v1/users/#{@user['id']}/orders", params: {
      user_id: @user['id'],
      model: order.model,
      vrl_year: order.vrl_year,
      num_parcel: order.num_parcel
    }
    expect(JSON.parse(response.body)['status']).to eq('SUCCESS')
  end
end
