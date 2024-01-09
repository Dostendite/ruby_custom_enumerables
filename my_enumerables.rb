module Enumerable; end

class Array
  def my_each
    for element in self
      yield(element)
    end
  end

  def my_each_with_index(idx = 0)
    for element in self
      yield(element, idx)
      idx += 1
    end
  end

  def my_select
    return_ary = []
    for element in self
      return_ary << element if yield(element)
    end
    return_ary
  end

  def my_all?
    for element in self
      return false if not yield(element)
    end
    true
  end

  def my_any?
    for element in self
      return true if yield(element)
    end
    false
  end

  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    for element in self
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    new_ary = []

    for element in self
      new_ary << yield(element)
    end
    new_ary
  end

  def my_inject(accumulator = 0)
    for element in self
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end
