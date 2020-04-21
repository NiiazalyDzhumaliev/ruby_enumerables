module Enumerable

  def my_each
    for i in(0...self.size) do
      yield(self[i])   
    end
  end
  
  [1,2,3,4,5].my_each do |num|
    print num
  end
  
  def my_each_with_index
    for i in(0...self.size) do
      yield(self[i], i)   
    end
  end
  
  [1,2,3,4,5].my_each_with_index do |num, index|
      print index
  end
  
  def my_select 
     array = []
     self.my_each do |e|
      array << e if yield(e)
     end
     array
  end
  
  [1,2,3,4,5].my_select do |num|
     num > 1
  end
  
  
  def my_all? 
     self.my_each do |e|
       unless yield(e)
        return false
       end
     end
     true
  end
  
  [1,2,3,4,5].my_all? do |num|
     num>0
  end
  
  def my_any?
    self.my_each do |e|
       if yield(e) 
        return true
       end
    end
    false
  end
  
  [1,2,3,4,5].my_any? do |num|
     num == 2
  end
  
  def my_none?
    self.my_each do |e|
        if yield(e)
          return false
        end
    end
    true
  end
  
  [1,2,3,4,5].my_none? do |num|
     num == 5
  end
  
  def my_count
    count = 0
    self.my_each do |e|
      count += 1 if yield(e)
    end
    count
  end
  
  [1,2,3,nil,5].my_count do |num|
     num == nil
  end
