require 'rails_helper'

RSpec.describe User, type: :model do
  # context 'when model user is valid' do
  #   it { should validate_presence_of(:title) }
  # end
  context 'when model user is valid' do
    subject { build(:user) }
    it { expect(subject).to be_valid }
  end

  context 'when model is save' do
    subject { create(:user) }
    it { expect(subject).to be_valid }
  end

  context 'when model user is not valid' do
    subject { build(:user, cpf: nil) }
    it { expect(subject).not_to be_valid }
  end
end
