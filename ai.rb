class Ai
    
    def get_move
        letters = ["a","b","c"]
        random_letter = letters[rand(3)]
        random_number = rand(1..3).to_s
        random_move = (random_number + random_letter).strip
        return "#{random_move}"
    end

end
