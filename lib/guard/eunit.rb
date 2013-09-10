require 'guard'
require 'guard/guard'
# require "guard/eunit/version"

module Guard
  class EUnit < Guard
    require 'guard/eunit/runner'

    def initialize(watchers = [], options = {})
      super
    end

    def run_all
      run_eunits
    end

    def run_on_change(paths)
      suites = paths.map { |p| File.basename(p, ".erl") }
      run_eunits suites
    end

    def run_eunits(suites=[])
      success = Runner.run suites

      throw :task_has_failed unless success
    end
  end
end
