require 'rails_helper'

describe Exercise, type: :model do
  subject {
    described_class.new(
      name: 'Supino',
      sets: 3,
      reps: 12,
      rest: 60,
      muscle_group: 'peitoral',
      training_id: 1
    )
  }

  context 'attributes' do
    it 'is not valid without name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without sets' do
      subject.sets = nil
      subject.valid?
      expect(subject.errors[:sets]).to include("can't be blank")
    end

    it 'is not valid without reps' do
      subject.reps = nil
      subject.valid?
      expect(subject.errors[:reps]).to include("can't be blank")
    end

    it 'is not valid without rest' do
      subject.rest = nil
      subject.valid?
      expect(subject.errors[:rest]).to include("can't be blank")
    end

    it 'is not valid without muscle_group' do
      subject.muscle_group = nil
      subject.valid?
      expect(subject.errors[:muscle_group]).to include("can't be blank")
    end

    context 'and :sets' do
      it 'is an integer' do
        subject.sets = 'number'
        subject.valid?
        expect(subject.errors[:sets]).to include('is not a number')
      end

      it 'is an integer' do
        subject.sets = 0.3
        subject.valid?
        expect(subject.errors[:sets]).to include('must be an integer')
      end

      it 'is greather than 0' do
        subject.sets = 0
        subject.valid?
        expect(subject.errors[:sets]).to include('must be greater than 0')
      end
    end

    context 'and :reps' do
      it 'is an integer' do
        subject.reps = 'number'
        subject.valid?
        expect(subject.errors[:reps]).to include('is not a number')
      end

      it 'is an integer' do
        subject.reps = 0.3
        subject.valid?
        expect(subject.errors[:reps]).to include('must be an integer')
      end

      it 'is greather than 0' do
        subject.reps = 0
        subject.valid?
        expect(subject.errors[:reps]).to include('must be greater than 0')
      end
    end

    context 'and :rest' do
      it 'is an integer' do
        subject.rest = 'number'
        subject.valid?
        expect(subject.errors[:rest]).to include('is not a number')
      end

      it 'is an integer' do
        subject.rest = 0.3
        subject.valid?
        expect(subject.errors[:rest]).to include('must be an integer')
      end

      it 'is greather than 0' do
        subject.rest = 0
        subject.valid?
        expect(subject.errors[:rest]).to include('must be greater than 0')
      end
    end
  end
end
