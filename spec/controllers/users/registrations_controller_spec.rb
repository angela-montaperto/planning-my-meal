require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  let(:valid_user_params) do
    {
      name: 'Tester',
      surname: 'Tester',
      email: Faker::Internet.email,
      privacy: '1',
      password: 'password123',
      password_confirmation: 'password123'
    }
  end

  let(:invalid_user_params) do
    {
      email: 'invalid_email',
      password: '123',
      password_confirmation: '456',
      privacy: '0'
    }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post '/profilo/registrazione', params: { user: valid_user_params }
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid_params' do
      it 'does not create a user and render page with errors' do
        expect {
          post '/profilo/registrazione', params: { user: invalid_user_params }
        }.to_not change(User, :count)

        expect(response).to have_http_status(422)
        expect(response.body).to include('Email formato non valido')
        expect(response.body).to include('Conferma password non corrispondente')
        expect(response.body).to include('Privacy obbligatorio')
      end
    end
  end
end
