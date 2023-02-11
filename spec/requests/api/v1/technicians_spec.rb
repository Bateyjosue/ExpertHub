require 'swagger_helper'

RSpec.describe 'api/v1/technicians', type: :request do
  path '/api/v1/technicians' do
    get('list technicians') do
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

    post('create technician') do
      response(200, 'technician added successfully') do
        consumes 'application/json'
        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            specialization: { type: :string },
            image: { type: :string }
          },
          required: %w[name location charges specialization image]
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

  path '/api/v1/technicians/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show technician') do
      response(200, 'successful') do
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

    patch('update technician') do
      response(200, 'successful') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            specialization: { type: :string },
            image: { type: :string }
          },
          required: %w[name location charges specialization image]
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

    put('update technician') do
      response(200, 'successful') do
        let(:id) { '123' }

        parameter name: :technician, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            specialization: { type: :string },
            image: { type: :string }
          },
          required: %w[name location charges specialization image]
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

    delete('delete technician') do
      response(200, 'successful') do
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
