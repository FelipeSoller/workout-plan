require 'rails_helper'

describe User, type: :model do
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

    describe '#teacher?' do
      context "when profile is different to teacher" do
        before { subject.profile = "student" }
        it 'returns false' do
          expect(subject.teacher?).to be false
        end
      end

      context "when profile is equal to teacher" do
        before { subject.profile = "teacher" }
        it 'returns true' do
          expect(subject.teacher?).to be true
        end
      end
    end

    describe '#student?' do
      context "when profile is different to student" do
        before { subject.profile = "teacher" }
        it 'returns false' do
          expect(subject.student?).to be false
        end
      end

      context "when profile is equal to student" do
        before { subject.profile = "student" }
        it 'returns true' do
          expect(subject.student?).to be true
        end
      end
    end

    describe "validation" do
      context "when profile is teacher" do
        before { subject.profile = "teacher" }
        it "validates absent of student_id" do
          subject.student = Student.new
          subject.valid?
          expect(subject.errors[:student_id]).to include("must be blank")
        end
      end

      context "when profile is student" do
        before { subject.profile = "student" }
        it "validates absent of teacher_id" do
          subject.teacher = Teacher.new
          subject.valid?
          expect(subject.errors[:teacher_id]).to include("must be blank")
        end
      end
    end
  end
end
