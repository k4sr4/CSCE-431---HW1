# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  result = 0
  arr.each do |num|
    result += num
  end
  return result
end

def max_2_sum arr
  max = 0
  temp = 0
  count = 0
  arr.each do |num|
    if (max == 0)
      max += num
      temp += num
      count += 1
    else
      if (count == 1)
        count += 1
        max = temp + num
      elsif ((temp + num) > max)
        max = temp + num
      end
      
      if (num > temp)
        temp = num
      end
    end
  end
  return max
end

def sum_to_n? arr, n
  sum = 0
  result = false
  if(arr.length == 0 || arr.length == 1)
    return result
  end
  
  0.upto(arr.length - 1) do |i|
    fixed = arr[i]
    (i+1).upto(arr.length - 1) do |j|  
      if (arr[i] + arr[j] == n)
        result = true
        return result
      end
    end
  end
  return result
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  if s.empty?
    return false
  elsif (/[a-z]/ =~ s[0].downcase && /[^a,u,i,o,e]/ =~ s[0].downcase)
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  if s.empty?
    return false
  elsif(/[^0, 1]/ =~ s)
    return false
  end
  
  return s.to_i(2) % 4 == 0
end

# Part 3

class BookInStock
  attr_accessor :price, :isbn
  
  def initialize (isbn, price)
    raise ArgumentError if isbn == "" || price <= 0
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
    if(price % 1 == 0)
      s = "$" + price.to_s + ".00"
    else
      parts = price.to_s.split(".")
      if(parts[1].length > 1)
        s = "$" + price.to_s
      else
        s = "$" + parts[0] + "." + parts[1] + "0"
      end
    end
  end
end
