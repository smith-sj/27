# frozen_string_literal: true

require 'cspec'
require_relative "game_output"
require_relative "game_validator"
require_relative "adjudicator"

result = CSpec::Runner.run!("#{Dir.pwd}/specs.csv")
exit result ? 0 : 1