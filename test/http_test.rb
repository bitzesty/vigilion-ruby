require_relative "./test_helper.rb"

ENV["VIRUS_SCANNER_API_URL"] = "http://localhost:3000"

describe VirusScanner::HTTP do
  describe "#post" do
    it "returns status of job if posted with success" do
      # stub POST request for providing URL to files for scan
      stub_request(:post, "localhost:3000/scan").to_return(
        body:
        { status: "scanning" }.to_json)

      # check if stubbed URL provides status for scan job
      scan_request = VirusScanner::HTTP.new.post("de401fdf-08b0-44a8-810b-20794c5c98c7", "url")
      assert_includes(scan_request["status"], "scanning")
    end
  end

  describe "#get" do
    it "returns status of a job for provided uuid" do
      stub_request(:get, "localhost:3000/status/de401fdf-08b0-44a8-810b-20794c5c98c7").to_return(
        body:
        { id: "de401fdf-08b0-44a8-810b-20794c5c98c7",
          result: "------------ SCAN SUMMARY -----------",
          md5: "69630e4574ec6798239b091cda43dca0",
          status: "error" }.to_json)

      assert_includes(
        VirusScanner::HTTP.new.get("de401fdf-08b0-44a8-810b-20794c5c98c7"),
        "error")
      assert_includes(
        VirusScanner::HTTP.new.get("de401fdf-08b0-44a8-810b-20794c5c98c7"),
        "SCAN SUMMARY")
      assert_includes(
        VirusScanner::HTTP.new.get("de401fdf-08b0-44a8-810b-20794c5c98c7"),
        "69630e4574ec6798239b091cda43dca0")
      assert_includes(
        VirusScanner::HTTP.new.get("de401fdf-08b0-44a8-810b-20794c5c98c7"),
        "de401fdf-08b0-44a8-810b-20794c5c98c7")
    end
  end
end
