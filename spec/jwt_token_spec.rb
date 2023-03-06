# spec/jwt_token_spec.rb
require "jwt_token"

describe JsonWebToken do
    # tests based on known input and output from JWT.io
    describe ".encode" do
        context "given a simple static payload" do
            it "returns the encoded jwt" do
                @payload = {
                    "user": "testing",
                    "phrase": "atomic_jolt_rocks",
                    "test_code": 1
                }
                @token = JsonWebToken.encode(@payload)
                @expected = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdGluZyIsInBocmFzZSI6ImF0b21pY19qb2x0X3JvY2tzIiwidGVzdF9jb2RlIjoxfQ.10xeSfDbFLLTJJsejh_A2I_DU1Eyxdl8iXwdGHcAlXI"
                expect(@token).to eq(@expected)
            end
        end
    end
    # tests based on known input and output from JWT.io
    describe ".decode" do
        context "given a token" do
            it "returns the payload" do
                @token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidGVzdGluZyIsInBocmFzZSI6ImF0b21pY19qb2x0X3JvY2tzIiwidGVzdF9jb2RlIjoxfQ.10xeSfDbFLLTJJsejh_A2I_DU1Eyxdl8iXwdGHcAlXI"
                @payload = JsonWebToken.decode(@token)
                @expected = {
                    "phrase"=>"atomic_jolt_rocks", 
                    "test_code"=>1, 
                    "user"=>"testing"
                }
                expect(@payload).to eq(@expected)
            end
        end
    end
    context "given a dynamic, time-based payload" do
        it "correctly decrypts to the original payload" do
            time = Time.now
            payload = { "timestamp"=> time.inspect }
            token = JsonWebToken.encode(payload)
            decoded_payload = JsonWebToken.decode(token)
            expect(decoded_payload).to eq(payload)
        end
    end
end