RSpec.describe Analysis, type: :model do
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :resource }
  it { is_expected.to have_db_column :request_ip }
  it { is_expected.to have_db_column :results }

  # it 'is expected to have a valid factory' do
  #   expect(create(:analysis)).to be_valid
  #   end
end
