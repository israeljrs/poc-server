require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'when model order is valid' do
    subject { build(:order) }
    it { expect(subject).to be_valid }
  end

  context 'when model is save' do
    subject { create(:order) }
    it { expect(subject).to be_valid }
  end

  context 'when model order is not valid' do
    subject { build(:order, vrl_year: nil) }
    it { expect(subject).not_to be_valid }
  end
end
