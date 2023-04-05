require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { User.new(name: 'Girma t', email: 'test@gmail.com', password: '123bhu') }

  before { subject.save }
  it 'Payment inharitans from ApplicationRecord' do
    expect(Payment < ApplicationRecord).to eq(true)
  end

  context 'validations' do
    it 'Name of Payment should be Son Cloth' do
      payments = Payment.create!(author_id: subject.id, name: 'Son Cloth', amount: 3.2)

      expect(payments.name).to eq('Son Cloth')
    end
    it 'should be valid when the user exist' do
      payments = Payment.create!(author_id: subject.id, name: 'Son Cloth', amount: 3.2)
      expect(payments).to be_valid
    end

    it 'Not valid with out user' do
      payments = Payment.create(name: 'Son Cloth', amount: 3.2)
      expect(payments.errors[:author]).to include('must exist')
    end

    it 'Name must be present' do
      payments = Payment.create(author_id: subject.id, amount: 3.2)
      expect(payments.errors[:name]).to include("can't be blank")
    end

    it 'not valid when amount less than zero' do
      payments = Payment.create(author_id: subject.id, name: 'Son Cloth', amount: -10)
      expect(payments.errors[:amount]).to include('must be greater than or equal to 0')
    end
  end
end
