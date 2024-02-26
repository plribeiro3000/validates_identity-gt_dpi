# frozen_string_literal: true

require_relative 'lib/validates_identity/gt_dpi/version'

Gem::Specification.new do |spec|
  spec.name = 'validates_identity-gt_dpi'
  spec.version = ValidatesIdentity::GtDpi::VERSION
  spec.authors = ['Paulo Ribeiro']
  spec.email = ['plribeiro3000@gmail.com']

  spec.summary = 'Validates Guatemala DPI Document and test it with matchers in a simple way.'
  spec.homepage = 'https://github.com/plribeiro3000/validates_identity-gt_dpi'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/plribeiro3000/validates_identity-gt_dpi/blob/master'
  spec.metadata['changelog_uri'] = 'https://github.com/plribeiro3000/validates_identity-gt_dpi/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activemodel'
  spec.add_runtime_dependency 'validates_identity'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
