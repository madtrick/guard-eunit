require 'guard'
require 'guard/guard'
# require "guard/eunit/version"

module Guard
  class EUnit < Guard
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
      cmd = 'rebar eunit skip_deps=true'
      if !suites.empty?
        cmd += " suites=#{suites.join ','}"
        suites_output = suites.join ' '
      else
        suites_output = "all suites"
      end
      UI.info "*************************************", :reset => true
      UI.info "Running: #{cmd}", :reset => true
      output = `#{cmd}`

      if $? == 0
        UI.info "Success"
        Notifier.notify(suites_output,
          :title => "EUnit Tests Passed",
          :image => :success
          )
      else
        if match = output.match(
            %r{.*(Failed: \d+\.\s+Skipped: \d+\.\s+Passed: \d+\.).*}m
            )
          status = match[1]
          UI.error output, :reset => true
          Notifier.notify("#{status}\n#{suites_output}",
            :title => "EUnit Tests Failed",
            :image => :failed
            )
        else
          UI.error output, :reset => true
          Notifier.notify(suites_output,
            :title => "EUnit Unrecognized Output",
            :image => :failed
            )
        end
      end
    end
  end
end
