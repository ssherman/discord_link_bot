# frozen_string_literal: true

require_relative "lib/discord_link_bot/version"

Gem::Specification.new do |spec|
  spec.name = "discord_link_bot"
  spec.version = DiscordLinkBot::VERSION
  spec.authors = ["Shane Sherman"]
  spec.email = ["shane.sherman@gmail.com"]

  spec.summary = "Discord bot to rename links"
  spec.description = "Discord bot to rename links"
  spec.homepage = "https://github.com/ssherman"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ssherman"
  spec.metadata["changelog_uri"] = "https://github.com/ssherman"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "discordrb", "~> 3.4"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
