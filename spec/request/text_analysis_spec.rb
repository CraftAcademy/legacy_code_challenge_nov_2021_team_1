# frozen_string_literal: true

RSpec.describe Api::AnalysesController, type: :request do
  describe 'Text analysis' do
    before do
      post '/api/analyses', params: {
        analysis: { resource: 'This is awesome',
                    category: :text }
      }
    end
    it 'responds with an text analysis' do
      expect(response.status).to eq 200
    end

    it 'is expected to return requested analysis' do
      expect(response_json)['analysis']['resource'].to eq 'This is awesome'
    end
    it 'is expected to return results' do
      expect(response_json)['analysis']['results'].to eq {}
    end
  end
end
