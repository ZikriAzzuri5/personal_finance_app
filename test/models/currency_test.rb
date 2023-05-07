# == Schema Information
#
# Table name: currencies
#
#  id           :bigint           not null, primary key
#  code         :string           not null
#  country_code :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class CurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
