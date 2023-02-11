require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  let(:user) do
    { user: { name: 'kehinde', email: 'email@domain.com', password: 'Password1' } }
  end

  path '/users' do
    post('create registration') do
      response(200, 'Sign up successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string },
            password: { type: :string }
          },
          required: %w[name email password]
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
end
