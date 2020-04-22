module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |i|
      yield(self[i])
    end
  end

  puts [1, 2, 3, 4, 5].my_each

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    size.times do |i|
      yield(self[i], i)
    end
  end

  [1, 2, 3, 4, 5].my_each_with_index do |_num, index|
    print index
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    array = []
    my_each do |e|
      array << e if yield(e)
    end
    array
  end

  [1, 2, 3, 4, 5].my_select

  def my_all?
    my_each do |e|
      return false unless yield(e)
    end
    true
  end

  # [1,2,3,4,5].my_all? do |num|
  #    num>0
  # end

  def my_any?
    my_each do |e|
      return true if yield(e)
    end
    false
  end

  # [1,2,3,4,5].my_any? do |num|
  #    num == 2
  # end

  def my_none?
    my_each do |e|
      return false if yield(e)
    end
    true
  end

  # [1,2,3,4,5].my_none? do |num|
  #    num == 5
  # end

  def my_count
    count = 0
    my_each do |e|
      count += 1 if yield(e)
    end
    count
  end

  # [1,2,3,nil,5].my_count do |num|
  #    num == nil
  # end
end
