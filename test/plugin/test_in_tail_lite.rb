require 'helper'

class TailLiteInputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
    FileUtils.rm_rf(TMP_DIR)
    FileUtils.mkdir_p(TMP_DIR)
  end

  TMP_DIR = File.dirname(__FILE__) + "/../tmp"

  CONFIG = %[
    path #{TMP_DIR}/tail.txt
    tag test
    field_name record
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::InputTestDriver.new(Fluent::TailInputLite).configure(conf)
  end

  def test_configure
    d = create_driver
    assert_equal ["#{TMP_DIR}/tail.txt"], d.instance.paths
    assert_equal "test", d.instance.tag
    assert_equal "record", d.instance.field_name
  end

  def test_emit
    File.open("#{TMP_DIR}/tail.txt", "w") {|f|
      f.puts "test1"
      f.puts "test2"
    }

    d = create_driver

    d.run do
      sleep 1

      File.open("#{TMP_DIR}/tail.txt", "a") {|f|
        f.puts "test3"
        f.puts "test4"
      }
      sleep 1
    end

    emits = d.emits
    assert_equal(true, emits.length > 0)
    assert_equal({"record"=>"test3"}, emits[0][2])
    assert_equal({"record"=>"test4"}, emits[1][2])
  end
end
