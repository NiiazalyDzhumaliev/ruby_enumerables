module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    size.times do |i|
      yield(self[i], i)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    array = []
    my_each do |e|
      array << e if yield(e)
    end
    array
  end

  def my_all?(arg = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    my_each do |item|
      if arg.class == Class
        return false unless arg === item # rubocop:disable Style/CaseEquality
      elsif arg.class == Regexp
        return false unless arg =~ item
      elsif block_given?
        return false unless yield(item)
      elsif arg
        return false unless item == arg
      else
        return false unless item
      end
    end
    true
  end

  def my_any?
    my_each do |e|
      return true if yield(e)
    end
    false
  end

  def my_none?
    my_each do |e|
      return false if yield(e)
    end
    true
  end

  def my_count
    count = 0
    my_each do |e|
      count += 1 if yield(e)
    end
    count
  end
end
