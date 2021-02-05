require 'rails_helper'
require 'faker'

RSpec.describe Jot, type: :model do
  fixtures :users, :categories

  let(:image) { File.open(Rails.root.join('spec/files/images/image-1.png')) }
  let(:params) do
    { title: 'Fake jot article',
      text: 'I am a test article for the jot model',
      categories: [categories(:one)],
      author: users(:one) }
  end
  subject { described_class.new(params) }

  before do
    subject.image.attach(io: image, filename: File.basename(image), content_type: 'image/*')
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }

    it 'should not validate without an image attached' do
      subject.image = nil
      expect(subject.valid?).to be(false)
    end

    it 'should not validate without at least one category' do
      subject.categories = []
      expect(subject.valid?).to be(false)
    end

    it 'should validate with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'should save new data to database' do
      expect(subject.save).to be(true)
      expect(subject.id).to_not be_nil
    end
  end

  describe 'associations' do
    it { should belong_to(:author).class_name(:User) }
    it { should have_many(:tags).dependent(:destroy) }
    it { should have_many(:categories).through(:tags) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_one_attached(:image) }
  end
end
