module Utils
  def select_options(option)
    puts "Choose an #{option}"
    puts "[ 1 ] Select an #{option} from the list"
    puts "[ 2 ] Add a new #{option}"
  end

  def add_list(option)
    puts "Time to add an #{option}! "
    puts "This is the list of #{option} available:"
  end
end
