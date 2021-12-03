# frozen_string_literal: true

RSpec.describe Api::AnalysesController, type: :request do
  describe 'Image analysis' do
    describe 'SAFE' do
      before do
        post '/api/analyses', params: { analysis: {
          resource: 'https://c.tadst.com/gfx/1200x630/sunrise-sunset-sun-calculator.jpg?1',
          category: :image
        } }
      end

      it {
        expect(response).to have_http_status 200
      }

      it 'is expected to be safe' do
        expect(response_json['results']['safe'].to_f > 0.9)
          .to be true
      end

      it 'is expected to be non_explicit' do
        expect(response_json['results']['explicit'].to_f > 0.9)
      end

      it 'is expected to be non_suggestive' do
        expect(response_json['results']['suggestive'].to_f > 0.9)
      end

      it 'is expected to be non_drug related' do
        expect(response_json['results']['drug'].to_f > 0.9)
      end

      it 'is expected to be without gore in anyway' do
        expect(response_json['results']['gore'].to_f > 0.99)
      end

    end

    describe 'UNSAFE' do
      before do
        post '/api/analyses', params: { analysis: {
          resource: 'https://www.abc.net.au/cm/rimage/11076160-1x1-xlarge.jpg?v=2',
          category: :image
        } }
      end
      it {
        expect(response).to have_http_status 200
      }

      it 'is expected to be suggesstive' do
        expect(JSON.parse(response.body)['results']['suggestive'].to_f > 0.9)
          .to be_truthy
      end
    end
  end
end
