require_relative "./test_helper.rb"

describe Vigilion::Configuration do
  describe "configure" do
    it "allows set attributes" do
      Vigilion.configure do |config|
        config.attribute = "something"
      end

      assert_equal Vigilion::Configuration.attribute, "something"
    end

    it "has default values" do
      refute_nil Vigilion::Configuration.server_url
      refute_nil Vigilion::Configuration.api_key
    end
  end
end