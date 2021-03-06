# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_cte/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_cte"
  spec.version       = ActiveRecordCTE::VERSION
  spec.authors       = ["axvm"]
  spec.email         = ["axvmindaweb+gh@gmail.com"]

  spec.summary       = %q{ Common Table Expression support in AR }
  spec.description   = %q{ Allows you to use postgresql CTE in ActiveRecord}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
