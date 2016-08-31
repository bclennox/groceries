require_relative '../../models/json_api_serializer'

RSpec.describe JsonApiSerializer do
  Model = Struct.new(:values) do
    def method_missing(method, *args, &block)
      values.key?(method) ? values[method] : super
    end
  end

  context 'with a single model' do
    let(:friends) do
      [Model.new(id: 10, name: 'Lindsay'), Model.new(id: 11, name: 'Rowan')]
    end

    let(:model) do
      Model.new(id: 1, name: 'Brandan', friends: friends)
    end

    subject do
      described_class.new(model).as_json
    end

    it 'includes :type' do
      expect(subject.dig(:data, :type)).to eq('Model')
    end

    it 'includes :id' do
      expect(subject.dig(:data, :id)).to eq(1)
    end

    it 'includes :attributes' do
      expect(subject.dig(:data, :attributes, :name)).to eq('Brandan')
    end

    context 'relationships' do
      subject do
        described_class.new(model, relationships: :friends).as_json
      end

      it 'includes :relationships' do
        friend = subject.dig(:data, :relationships, :friends, :data).first

        expect(friend[:type]).to eq('Model')
        expect(friend[:id]).to eq(10)
        expect(friend[:name]).to be_nil
      end

      it 'includes :included' do
        friend = subject[:included].first

        expect(friend[:type]).to eq('Model')
        expect(friend[:id]).to eq(10)
        expect(friend[:attributes][:name]).to eq('Lindsay')
      end
    end
  end
end
