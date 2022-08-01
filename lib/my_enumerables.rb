module Enumerable
  # Your code goes here

  def my_each_with_index
    (self.length).times{|i| yield(self[i], i)}
    return self
  end

  def my_select
    array = []
    (self.length).times{|i| 
      if(yield(self[i]))
        array.push(self[i])
      end
    }
    return array
  end

  def my_all?
    check = true
    (self.length).times{|i| 
      unless(yield(self[i]))
        check = false
      end
    }
    return check
  end

  def my_any?
    check = false
    (self.length).times{|i| 
      if(yield(self[i]))
        check = true
      end
    }
    return check
  end

  def my_none?
    check = true
    (self.length).times{|i| 
      if(yield(self[i]))
        check = false
      end
    }
    return check
  end

  def my_count
    if(yield() == nil)
      self.length
    else
      my_select
    end
  end

  def my_map
    if block_given?
      array = []
      (self.length).times{|i| array.push(yield(self[i]))}
      return array
    else
      array = []
      (self.length).times{|i| self.call(yield(self[i]))}
      return array
    end
  end
 
  def my_inject(initial)
    inject = initial
    (self.length).times{|i| inject = yield(inject,self[i])}
    return inject
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
  def my_each
    (self.length).times{|i| yield(self[i])}
    return self
  end
end
