require 'rails_helper'

describe User, type: :model do
  subject {
    described_class.new(
      email: 'email@email.com'
    )
  }

  context 'attributes' do
    it 'is not valid without email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email]).to include("can't be blank")
    end

    context 'and password' do
      it 'must be greater than or equal to 6' do
        subject.password = 123
        subject.valid?
        expect(subject.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it '#password' do
        expect(subject.password).to eq("123123123")
      end

      it 'should match with password confirmation' do
        subject.password_confirmation = "123123123"

        expect(subject.password).to eq(subject.password_confirmation)
      end
    end

    context '#teacher?' do
      it 'profile should be teacher' do
        expect(subject.teacher?).to be false
      end
    end

    context '#student?' do
      it 'profile should be student' do
        expect(subject.student?).to be false
      end
    end

      xit '#ensure_that_no_student_and_teacher_at_the_same_time' do
        expect(subject.teacher? && student).to be false
      end
  end
end
