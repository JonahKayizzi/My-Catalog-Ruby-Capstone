module Utils
  def select_options(option)
    puts "Choose #{option}"
    puts "[ 1 ] Select #{option} from the list"
    puts "[ 2 ] Add a new #{option}"
  end

  def add_list(option)
    puts "Time to add #{option}! "
    puts "This is the list of #{option} available:"
  end
end
