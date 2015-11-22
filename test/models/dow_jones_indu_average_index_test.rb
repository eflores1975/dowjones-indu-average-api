require 'test_helper'

class DowJonesInduAverageIndexTest < ActiveSupport::TestCase
	set_fixture_class dowjonesindustrial: DowJonesInduAverageIndex 
	fixtures :dow_jones_indu_average_indices

	test "should not be empty" do
		indices = DowJonesInduAverageIndex.count
	  assert_equal(2, indices, "Table is not empty")
	end
  # test "the truth" do
  #   assert true
  # end
end
