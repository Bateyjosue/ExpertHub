require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  let(:user) do
    create(:user, email: 'kehinde@domain.com', password: 'Password1')
  end

  before do
    sign_in(user)
  end

  path '/users/sign_in' do
    post('create session') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            password: { type: :string }
          },
          required: %w[name password]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/sign_out' do
    delete('delete session') do
      after do
        logout(:user)
      end
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
