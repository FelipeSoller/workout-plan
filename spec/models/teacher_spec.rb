require 'rails_helper'

describe Teacher, type: :model do
  subject {
    described_class.new(
      name: 'Teacher'
    )
  }

  context 'attributes' do
    it 'is not valid without name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name]).to include("can't be blank")
    end
  end

  context 'and :name' do
    it 'should be greather than 2 characters' do
      subject.name = 'A'
      subject.valid?
      expect(subject.errors[:name]).to include("is too short (minimum is 2 characters)")
    end

    it 'is less than 20' do
      subject.name = 'AAAAAAAAAAAAAAAAAAAAA'
      subject.valid?
      expect(subject.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end
end