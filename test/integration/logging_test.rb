require 'test_helper'

class HarnessTest < MiniTest::Unit::TestCase
  def setup
    Harness.adapter = :null
    gauges.clear ; counters.clear
  end

  def test_metrics_are_logged
    gauge = Harness::Gauge.new :name => 'minitest'
    gauge.log

    assert_includes gauges, gauge
  end

  private
  def gauges
    Harness::NullAdapter.gauges
  end

  def counters
    Harness::NullAdapter.counters
  end
end