require 'rails_helper'

describe Training, type: :model do
  context 'attributes' do
    it 'is not valid without title' do
      subject.title = nil
      subject.valid?
      expect(subject.errors[:title]).to include("can't be blank")
    end
  end

  context 'and :title' do
    it 'should be greather than 5 characters' do
      subject.title = 'A'
      subject.valid?
      expect(subject.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'should be greather than 5 characters' do
      subject.title = 'AA'
      subject.valid?
      expect(subject.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'should be greather than 5 characters' do
      subject.title = 'AAA'
      subject.valid?
      expect(subject.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'should be greather than 5 characters' do
      subject.title = 'AAAA'
      subject.valid?
      expect(subject.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'is less than 20' do
      subject.title = 'AAAAAAAAAAAAAAAAAAAAA'
      subject.valid?
      expect(subject.errors[:title]).to include("is too long (maximum is 20 characters)")
    end
  end
end