# frozen_string_literal: true

require 'date'

def initialize_system
  puts 'Bem vindo ao Desafio de algoritmo nº 1 da iugu'
  puts 'Digite a data de nascimento neste formato dd/mm/yyyy para que possamos lhe encaminhar para o atendimento ...'

  input_date = gets.strip.split('/')

  begin
    @birth_date = Time.new(input_date[2], input_date[1], input_date[0])
  rescue
    return puts "Data informada é inválida, formato esperado ===> dd/mm/yyyy"
  end

  puts "Você será atendido na #{find_my_room}"
end

def find_my_room
  if calculate_age < [25, 2, 15].join
    'Sala 1'
  elsif calculate_age.between?([25, 2, 16].join, [45, 1, 0].join)
    'Sala 2'
  elsif calculate_age.between?([45, 1, 1].join, [65, 0, 0].join)
    'Sala 3'
  else
    'Sala 4'
  end
end

def calculate_age
  birth_date = @birth_date

  current_date = Time.new

  day = current_date.day - birth_date.day
  month = current_date.month - birth_date.month
  year = current_date.year - birth_date.year

  if day.negative?
    day = days_in_month(current_date)[birth_date.month] - birth_date.day + current_date.day
    month -= 1
  elsif month.negative?
    month = 12 - birth_date.month + current_date.month
    year -= 1
  elsif year.negative?
    year, month, day = 0
  end

  [year, month, day].join
end

def days_in_month(current_date)
  days_in_month = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  days_in_month[2] = 29 if current_date.to_date.leap?

  days_in_month
end

initialize_system
