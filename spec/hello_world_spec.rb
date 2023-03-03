# spec/hello_world_spec.rb
require "hello_world"

describe HelloWorld do
    describe ".say" do
        context "when called" do
            it "returns 'Hello World!'" do
                expect(HelloWorld.say()).to eq("Hello World!")
            end
        end
    end
end