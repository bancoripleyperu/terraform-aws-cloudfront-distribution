require 'awspec'

service_name = `cd examples/test/ && terraform output id`.strip

describe cloudfront_distribution(service_name.to_s) do
    it { should exist }
end