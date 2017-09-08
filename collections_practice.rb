require 'pry'

def begins_with_r(array)
  truefalse = true
  array.each do |element|
    if element[0] != ("r" || "R")
      truefalse = false
      break
    end
  end
  truefalse
end

def contain_a(array)
  output = []
    array.each do |x|
      output << x if x.include?("a")
    end
  output
end

def first_wa(array)
  array.each do |x|
    return x if x.slice(0, 2) == "wa"
  end
end

def remove_non_strings(array)
  output = []
  array.each do |x|
    if x.is_a? String
      output << x
    end
  end
  output
end

def count_elements(array) #this doesnt all make sense yet, but its what I found online when I couldnt figure it out. It mostly makes sense
  foo = array.group_by(&:itself) #group_by(&:itself) groups like with like
  foo.map {|k, v| k.merge(count: v.length)} #merge will 'add' the 'count' variable to each current 'k', equal to v.length. k is each unique element, v is the array of all instances of that unique element.
end                       #will merge k hash with whats inside ( ), in this case a hash of {count: v.length}

# def merge_data(keys, data)
#   keys[0].values.map.with_index {|k, i| data[i].merge(k)} #found online, still slightly above my comprehension level, redid it below.
# end

def merge_data(keys, data)
  output = []
  keys.each {|element|
    element.each {|key, value| #Check on same name, add to corresponding data hash
      data.each {|names|
        names.each {|name, data_list| #data_list is attribute list in 'data'.
          if name == value
            data_list[key] = value
            output << data_list
          end
        }
      }
    }
  }
output
end

def find_cool(cool)
  cool.collect {|element|
    element.collect {|attribute, status|
      if attribute == :temperature && status == "cool"
        element
      end
    }
  }.flatten.compact
end

def organize_schools(schools)
  new_hash = {}
  schools.each {|name, location_hash|
    location_hash.each {|location_attribute, value|
      if new_hash.include?(value)
        new_hash[value] << name
      else
        new_hash[value] = [name]
      end
    }
  }
  new_hash
end
