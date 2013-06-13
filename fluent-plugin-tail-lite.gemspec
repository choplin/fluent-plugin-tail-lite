# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-tail-lite"
  s.version     = "0.0.1"
  s.authors     = ["OKUNO Akihiro"]
  s.email       = ["okuno.akihiro@gmail.com"]
  s.homepage    = "https://github.com/choplin/fluent-plugin-tail-lite"
  s.summary     = %q{Fluentd input plugin which read text files and emit each line as it is.}
  s.description = %q{Fluentd input plugin which read text files and emit each line as it is.}

  s.rubyforge_project = "fluent-plugin-tail-lite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd"
end
