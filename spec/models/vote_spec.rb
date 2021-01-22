require 'spec_helper'

RSpec.describe Vote, type: :model do
  fixtures :users, :jots

  subject { described_class.new(user: users(:one), jot: jots(:one)) }

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:jot_id) }

    it 'should validate with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'should save new vote to database' do
      expect(subject.save).to be(true)
      expect(subject.id).to_not be_nil
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:jot) }
  end
end
