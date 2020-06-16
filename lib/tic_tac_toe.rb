WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],  [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], 
  [6, 4, 2]
  ]
  
def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]}  "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]}  "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]}  "
end 

def input_to_index(input)
  input.to_i - 1
end 

def move(board, index, player)
  board[index] = player
end 

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true 
  else 
    false 
  end 
end 

def valid_move?(board, index)
   index.between?(0, 8) && !(position_taken?(board, index))
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end 
end 

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1 
    end 
  end 
  counter
end 

def current_player(board)
    num = turn_count(board)
    num % 2 == 0 ? "X" : "O"
end 

def won?(board)
  win_index = []
  empty_board =[" "]
  WIN_COMBINATIONS.detect do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else 
      false
    end
  end
end 

def full?(board)
  board.none? { |i| i == " " }
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || full?(board) && draw?(board)
end 

def winner(board)
  win_combination = won?(board)
  if win_combination != nil 
    win_location = win_combination[0]
    board[win_location]
  else 
    nil
  end
end 

def play(board)
  
end 

def play(board)
  input = turn.gets
  turns = 0
  play.over?(board) {|game| game == 9}
  until turns == 9
    turns += 1
    turn(board)
  end 
  play(board)
end 


