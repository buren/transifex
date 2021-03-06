require 'spec_helper'

describe Transifex::Translation do
  include_context "shared stuff"

  it 'has content' do
    expect(translation.content).to eq(translation_data.content)
  end

  it 'has a resource' do
    expect(translation.resource).to eq(resource)
  end

  it 'can convert the content to a hash' do
    res = translation.content_hash
    expect(res).to eq({ "en" => { 'test' => { 'test' => 'data' } } })
  end

  it 'raises an error if it does not recognize the type' do
    resource.type = 'invalid'
    expect { translation.content_hash }.to raise_error('Unrecognized content type: invalid')
  end
end