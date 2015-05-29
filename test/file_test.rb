require_relative "./test_helper.rb"

describe Vigilion::File do
  describe "#check_from_url" do
    it "returns info about scan job" do
      response = { "status" => "scanning" }
      Vigilion::HTTP.any_instance.stubs(:post).returns(response)
      assert_equal(Vigilion::File.scan_url(
                     "de401fdf-08b0-44a8-810b-20794c5c98c7",
                     "url-to-suspected-file"
                  ),"status" => "scanning")
    end
  end

  describe "#check_status" do
    it "returns OK when file is clean" do
      response = {
        "status" => "OK",
        "uuid" => "de401fdf-08b0-44a8-810b-20794c5c98c7",
        "md5" => "md5 hash" }
      Vigilion::HTTP.any_instance.stubs(:get).returns(response)

      assert_equal(Vigilion::File.check_status("de401fdf-08b0-44a8-810b-20794c5c98c7"),
                   "status" => "OK",
                   "uuid" => "de401fdf-08b0-44a8-810b-20794c5c98c7",
                   "md5" => "md5 hash")
    end
  end
end
