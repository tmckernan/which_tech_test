require "optparse"

class CLIOptions
  def initialize(args = [])
    @options = defaults.merge parse_args(args)
  end

  def email
    @options.fetch(:email)
  end

  private

  def defaults
    {
      email: 'test@example.com'.freeze
    }
  end

  def parse_args(args)
    opts = {}

    OptionParser.new.tap do |parser|
      parser.on("-e", "--email [EMAIL]") do |email|
        opts[:email] = String(email)
      end
      parser.parse(args)
    end
    opts
  end
end
