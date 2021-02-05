require 'rails_helper'

RSpec.describe Tag, type: :model do
  fixtures :jots, :categories

  subject { described_class.new(jot: jots(:one), category: categories(:one)) }

  describe 'validations' do
    it 'should validate with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'should save new tag to database' do
      expect(subject.save).to be(true)
      expect(subject.id).to_not be_nil
    end
  end

  describe 'associations' do
    it { should belong_to(:jot) }
    it { should belong_to(:category) }
  end
end
