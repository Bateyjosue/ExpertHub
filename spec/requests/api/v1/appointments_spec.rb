require 'swagger_helper'

RSpec.describe 'api/v1/appointments', type: :request do
  path '/api/v1/users/{user_id}/appointments' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list appointments') do
      response(200, 'successful') do
        let(:user_id) { '123' }

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

    post('create appointment') do
      response(200, 'successful') do
        let(:user_id) { '123' }

        consumes 'application/json'
        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            location: { type: :string },
            date: { type: :string },
            technician_id: { type: :integer }
          },
          required: %w[location date]
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

  path '/api/v1/users/{user_id}/appointments/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show appointment') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }

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

    patch('update appointment') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            location: { type: :string },
            date: { type: :string },
            technician_id: { type: :integer }
          },
          required: %w[location date]
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

    put('update appointment') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            location: { type: :string },
            date: { type: :string },
            technician_id: { type: :integer }
          },
          required: %w[location date]
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

    delete('delete appointment') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }

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

  path '/api/v1/technicians/{technician_id}/appointments' do
    # You'll want to customize the parameter types...
    parameter name: 'technician_id', in: :path, type: :string, description: 'technician_id'

    get('list appointments') do
      response(200, 'successful') do
        let(:technician_id) { '123' }

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

  path '/api/v1/technicians/{technician_id}/appointments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'technician_id', in: :path, type: :string, description: 'technician_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show appointment') do
      response(200, 'successful') do
        let(:technician_id) { '123' }
        let(:id) { '123' }

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
