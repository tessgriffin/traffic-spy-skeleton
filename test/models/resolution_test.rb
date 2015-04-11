require './test/test_helper'
require './test/create_sources_and_payloads'

class ResolutionTest < Minitest::Test
  include CreateSourcesAndPayloads

  def test_urls_can_be_added_to_table
    TrafficSpy::Resolution.create(dimension: "1980x1280")

    resolution = TrafficSpy::Resolution.last
    assert_equal "1980x1280", resolution.dimension
  end

  def test_resolution_have_payloads
    resolution = TrafficSpy::Resolution.create(dimension:"1980x1280")
    assert_equal [], resolution.payloads
  end
end