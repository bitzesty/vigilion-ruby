require_relative "./test_helper.rb"

describe Vigilion::HTTP do
  describe "#post" do
    it "returns status of job if posted with success" do
      # stub POST request for providing URL to files for scan
      stub_request(:post, "localhost:5000/scans").to_return(
        body: { "status" => "scanning" }.to_json)

      # check if stubbed URL provides status for scan job
      scan_request = Vigilion.scan_url("de401fdf-08b0-44a8-810b-20794c5c98c7", "url")
      assert_includes(scan_request, "scanning")
    end
  end

  describe "#get" do
    it "returns status of a job for provided uuid" do
      body = { id: "de401fdf-08b0-44a8-810b-20794c5c98c7",
          result: "------------ SCAN SUMMARY -----------",
          md5: "69630e4574ec6798239b091cda43dca0",
          status: "error" }.to_json

      stub_request(:get, "localhost:5000/scans/de401fdf-08b0-44a8-810b-20794c5c98c7").to_return(
        body: body)

      result = Vigilion.check_status("de401fdf-08b0-44a8-810b-20794c5c98c7")
      assert_equal(result, body)
    end
  end
end
