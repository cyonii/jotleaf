require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'J Doe', username: 'jdoe') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }

    it 'should not validate username with special characters' do
      subject.username = 'white space'
      expect(subject.valid?).to be(false)
    end

    it 'should validate with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'should save new user to database' do
      expect(subject.save).to be(true)
      expect(subject.id).to_not be_nil
    end
  end

  describe 'associations' do
    it { should have_many(:jots).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end
end
