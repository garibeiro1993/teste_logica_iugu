# frozen_string_literal: true
require 'prime'

def validate_number
  @number = ARGV[0].to_i

  result = ''
  result += 'esotérico.' if esoteric?
  result += 'cético. '   if skeptical?
  result += 'primo.'     if @number.prime?

  puts result
end

def esoteric?
  ((@number % 3).zero? && (@number % 5).zero?)
end

def skeptical?
  !esoteric?
end

validate_number
