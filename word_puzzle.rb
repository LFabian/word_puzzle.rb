
class Board

 attr_accessor :boards_templates
 @@boards_templates =  [["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
  def initialize
     complete_board!
  end
 
# A method that joins all the solutions     
  def solution 
     row_search  
     columns_search  
     diagonal_search
  end 

#This method builds the board   
  def to_s
    soup = @@boards_templates[1].to_s.scan(/...../)
    soup.each  {|x| puts "#{x}\n"} 
  end

#This method search for words in diagonal direction  
  def diagonal_search 
    diagonal = []
    diagonal_words = []
    search = @@boards_templates[1].to_s.scan(/./).each_slice(5).to_a
    for ca in 2..7 
      down = ca 
      for row in 0..ca
        if row <= 4 
        diagonal << search[down][row]
        down -= 1 
        end    
      end 
    end
    diagonal = diagonal.join  
    @@boards_templates[0].each  { |x| diagonal.include?(x) ? diagonal_words << x : diagonal_words.reverse.include?(x) ? diagonal_words << x : "No hay palabras en dirección diagonal" }
    #diagonal_words  
  end 

#This method searches for the words on horizontal direction 
  def row_search 
    horizontal_words = []
    search = @@boards_templates[1].to_s.scan(/...../).each_slice(1).to_a
    rows = search.join     
    @@boards_templates[0].each  { |x| rows.include?(x) ? horizontal_words << x : rows.reverse.include?(x) ? horizontal_words << x : "No hay palabras en dirección horizontal" }
    horizontal_words
  end 

#This method searches for words in vertical direction 
  def columns_search 
    column = [] 
    search = @@boards_templates[1].to_s.scan(/./).each_slice(5).to_a
    for h in 0..4
      for v in 0..7 
         column << search[v][h] 
      end   
    end  
    vertical_words = []
    vertical = column.join
    @@boards_templates[0].each do |x| 
      if vertical.include?(x)
        vertical_words  << x
      elsif vertical.reverse.include?(x)
        vertical_words << x 
      end 
    end 
    vertical_words
  end 

  private
  
#This method changes the X's on the board template to random letters 
  def complete_board!
      rand_letters = @@boards_templates[1].to_s.split("")
      rand_letters.each do |x|
        if x == 'X'
          x.gsub!( 'X', ('A'..'Z').to_a.sample)
          rand_letters
        end  
      end
    @@boards_templates[1] = rand_letters.join
    @@boards_templates
  end
end

board = Board.new
board.to_s
p board.solution 