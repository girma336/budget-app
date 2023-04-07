require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tarekegn', email: 'girma@gmail.com', password: '123bhu') }

  before { subject.save }
  it 'User inharitans from ApplicationRecord' do
    expect(User < ApplicationRecord).to eq(true)
  end

  it 'return corrent name' do
    expect(subject.name).to eq('Tarekegn')
  end

  it 'Return correct bio validate' do
    expect(subject.email).to eq('girma@gmail.com')
  end

  it 'Name Should be lenght greter than 5' do
    subject.name = 'hj'
    expect(subject).to_not be_valid
  end
end
