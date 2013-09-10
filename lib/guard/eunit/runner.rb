module Guard
  class EUnit
    module Runner
      require 'guard/eunit/formatter'

      class << self

        def run(suites)
          cmd = 'rebar eunit skip_deps=true'
          if !suites.empty?
            cmd += " suites=#{suites.join ','}"
            suites_output = suites.join ' '
          else
            suites_output = "all suites"
          end
          UI.info "Running: #{cmd}", :reset => true
          output = `#{cmd}`

          if $? == 0
            Formatter.success("Tests executed successfully")
            return true
          else
            if match = output.match(
                %r{.*(Failed: \d+\.\s+Skipped: \d+\.\s+Passed: \d+\.).*}m
                )
              Formatter.error("Test execution failed")
              Formatter.error(output)
            else
              Formatter.error("Unknown error")
            end
             return false
          end
        end

        private

        def extract_errors_from_output(output)
        end

      end
    end
  end
end
