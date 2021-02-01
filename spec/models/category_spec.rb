require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(name: 'Test Category', priority: 1) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
    it { should validate_uniqueness_of(:priority) }
    it { should validate_uniqueness_of(:name) }

    it 'should not validate without name' do
      subject.name = nil
      expect(subject.valid?).to be(false)
    end

    it 'should not validate without priority' do
      subject.priority = nil
      expect(subject.valid?).to be(false)
    end

    it 'should validate with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'should save new category to database' do
      expect(subject.save).to be(true)
      expect(subject.id).to_not be_nil
    end
  end

  describe 'associations' do
    it { should have_many(:tags).dependent(:destroy) }
    it { should have_many(:jots).through(:tags) }
  end
end
