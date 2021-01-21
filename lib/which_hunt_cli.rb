require "cli_options"
require 'which_hunt'
require 'pry'

class WhichHuntCli
  def self.run
    new.run
  end

  def run
    puts WhichHunt.new(options.email).find_which
  end

  private

  def options
    @options ||= CLIOptions.new(ARGV)
  end
end
