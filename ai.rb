require_relative "game_output"
require_relative "adjudicator"

class Ai

    def name
        names = ['Bob', 'Jenny', 'HorseyChick93', 'SpicyKing22', 'Albert', 'ThePun!sh3r', 'Kyle', 'PJ', 'David', 'Samantha']
        return names[rand(names.length)]
    end
    
    def get_move
        letters = ["a","b","c"]
        random_letter = letters[rand(3)]
        random_number = rand(1..3).to_s
        random_move = (random_number + random_letter).strip
        return "#{random_move}"
    end

    # Add current move to game
    def add_move(player, move, game)
        move_key = GameValidator.new.move_converter(move)
        game[move_key[0]][move_key[1]][move_key[2]] = player
    end


    def play_ai_turn(player_x, player_o, player_name, token, game_squares)

        x_tally = Adjudicator.new.tally_up(game_squares)[:x_tally]
        o_tally = Adjudicator.new.tally_up(game_squares)[:o_tally]

        # Print current game

        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

        puts "\nWaiting for #{player_name}..."

        sleep rand(3..6)

        # Check move is valid and unique

        while true

            move = Ai.new.get_move

            # puts "move is currently #{move}"

            if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)

                # puts "move is valid and unique"

                add_move(token, move, game_squares)

                # puts "added move"

                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                break

            elsif !GameValidator.new.is_valid(move)

                # puts "move is invalid"

                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                puts "\nInvalid Move! Try again.\n"

            elsif !GameValidator.new.is_unique(move, game_squares)

                # puts "stacking move on next board"

                move[0..0]= ((move[0]).to_i + 3).to_s

                # puts "new move is: #{move}"

                if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)

                    # puts "move is valid and unique"

                    add_move(token, move, game_squares)

                    # puts "added move"
                    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                    break

                elsif !GameValidator.new.is_valid(move)

                    # puts "move is invalid"

                    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                    puts "\nInvalid Move! Try again.\n"

                elsif !GameValidator.new.is_unique(move, game_squares)

                    # puts "stacking move on next board"

                    move[0..0]= ((move[0]).to_i + 3).to_s

                    # puts "new move is: #{move}"

                    if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)
                        
                        # puts "move is valid and unique"

                        add_move(token, move, game_squares)

                        # puts "added move"

                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                        break

                    elsif !GameValidator.new.is_valid(move)

                        # puts "move is invalid"

                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                        puts "\nInvalid Move! Try again.\n"

                    elsif !GameValidator.new.is_unique(move, game_squares)

                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

                        puts "\nStack is full! Try again.\n"
                    end
                end
            end
        end
    end

end