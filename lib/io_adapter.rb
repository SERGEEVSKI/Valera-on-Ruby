require 'singleton'

class IOAdapter
  include Singleton

  def output(msg)
    STDOUT.puts msg
  end

  def input(msg = '')
    output(msg)
    STDIN.gets.chomp
  end
end
