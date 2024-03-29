module SpreeAnalysis
  VERSION = '1.0.0'.freeze

  module_function

  # Returns the version of the currently loaded SpreeAnalysis as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION
  end
end
