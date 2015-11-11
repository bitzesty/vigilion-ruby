require_relative "./test_helper.rb"

describe Vigilion::HTTP do

  describe "constructor" do
    it "raises error without access_key_id" do
      Vigilion::Configuration.access_key_id = nil
      assert_raises Vigilion::Error do
        Vigilion::HTTP.new
      end
    end

    it "raises error without secret_access_key" do
      Vigilion::Configuration.secret_access_key = nil
      assert_raises Vigilion::Error do
        Vigilion::HTTP.new
      end
    end
  end

  describe "with credentials" do
    before do
      Vigilion.configure do |config|
        config.access_key_id = "some-key"
        config.secret_access_key = "some-secret"
      end
    end

    describe "#scan_url" do
      it "returns status of job if posted with success" do
        # stub POST request for providing URL to files for scan
        stub_request(:post, "localhost:5000/scans").to_return(
          body: { "status" => "scanning" }.to_json)

        # check if stubbed URL provides status for scan job
        scan_request = Vigilion.scan_url("id", "url")
        assert_includes(scan_request, "scanning")
      end

      it "accepts options" do
        # stub POST request for providing URL to files for scan
        stub_request(:post, "localhost:5000/scans").to_return(
          body: { "status" => "scanning" }.to_json)

        # check if stubbed URL provides status for scan job
        scan_request = Vigilion.scan_url("id", "url", force: true)
        assert_includes(scan_request, "scanning")
      end
    end

    describe "#scan_path" do
      it "returns status of job if posted with success" do
        # stub POST request for providing URL to files for scan
        stub_request(:post, "localhost:5000/scans").to_return(
          body: { "status" => "scanning" }.to_json)

        # check if stubbed URL provides status for scan job
        scan_request = Vigilion.scan_path("id", "test/sample_file.txt")
        assert_includes(scan_request, "scanning")
      end

      it "accepts options" do
        # stub POST request for providing URL to files for scan
        stub_request(:post, "localhost:5000/scans").to_return(
          body: { "status" => "scanning" }.to_json)

        # check if stubbed URL provides status for scan job
        scan_request = Vigilion.scan_path("id", "test/sample_file.txt", force: true)
        assert_includes(scan_request, "scanning")
      end
    end

    describe "#get" do
      it "returns status of a job for provided uuid" do
        body = { id: "de401fdf-08b0-44a8-810b-20794c5c98c7",
            result: "Eicar-Test-Signature FOUND",
            md5: "69630e4574ec6798239b091cda43dca0",
            status: "error" }.to_json

        stub_request(:get, "localhost:5000/scans/de401fdf-08b0-44a8-810b-20794c5c98c7").to_return(
          body: body)

        result = Vigilion.check_status("de401fdf-08b0-44a8-810b-20794c5c98c7")
        assert_equal(result, body)
      end
    end
  end
end
