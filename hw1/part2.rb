class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # m1 and m2 are arrays
  p1_choice = m1.fetch(1).downcase
  p2_choice = m2.fetch(1).downcase
  raise NoSuchStrategyError unless (p1_choice.gsub(/[rps]/,'').length == 0) and (p2_choice.gsub(/[rps]/,'').length == 0)
  if p1_choice == p2_choice
    return m1
  end
  case
  when p1_choice == 'r'
    case
    when p2_choice == 'p'
      m2
    when p2_choice == 's'
      m1
    end
  when p1_choice == 'p'
    case
    when p2_choice == 'r'
      m1
    when p2_choice == 's'
      m2
    end
  when p1_choice == 's'
    case
    when p2_choice == 'r'
      m2
    when p2_choice == 'p'
      m1
    end
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # game is an array of arrays
  rps_result(game.fetch(0),game.fetch(1))
end

def rps_player?(rps)
  #if rps.length == 2 and rps.fetch(1).to_s.downcase.gsub(/[rps]/,'').length == 0
  if rps.length == 2 and rps.fetch(1).length == 1
    true
  else
    false
  end
end

def rps_game?(game)
  rps_player?(game.fetch(0)) and rps_player?(game.fetch(1))
end

def rps_tournament_winner(tournament)
  if rps_player?(tournament)
    tournament
  elsif rps_game?(tournament)
    rps_tournament_winner(rps_game_winner(tournament))
  else
    rps_result(rps_tournament_winner(tournament.fetch(0)),
               rps_tournament_winner(tournament.fetch(1)))
  end
end
