class Node 
    attr_accessor :value, :next
    def initialize(value = nil)
        @value = value
        @next = nil 
    end 
end 

class LinkedList 
    attr_accessor :head, :tail 
    def initialize
        @head = nil 
        @tail = nil 
    end 

    def append(value)
        if(@head.nil?)
            @head = Node.new(value)
        else
            current = @head 
            while(!current.next.nil?)
                current = current.next 
            end 
                current.next = Node.new(value)
                @tail = current.next
        end 
    end
    
    def prepend(value)
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
    end
    
    def size 
        count = 0
        return 0 if @head.nil?
        current = head
        while(!current.nil?)
            current = current.next
            count += 1
        end 
        count 
    end 

    def at(index)
        count = 0
        if index > self.size 
            return "Not enough nodes"
        end 
        current = @head 
        while(count < index)
            current = current.next 
            count += 1
        end
        current 
        p "node at index #{index} is #{current.value}"
    end 

    def pop
        if self.size == 0
             return p "Can't pop from an empty list "
        end 
        if self.size == 1 
            @head = nil 
            @tail = nil
            return self.to_s
        end 
        current = @head  
        previous = nil 
        until current.next.nil?
            previous = current
            current = current.next 
        end 
        previous.next = current.next 
        current.next = nil 
         self.to_s
         puts self.size
    end 

    def contains?(value)
        current = @head 
        while (!current.nil?)
            if current.value == value 
                return true 
            end
            current = current.next
        end 
        return false 

    end 

    def find(value)
        current = @head
        idx = 0  
        while (current)

            if current.value == value 
                return idx
            end
            current = current.next 
            idx += 1 

        end 
        return -1   
    end 

    def to_s 
        result_str = ""
        current = @head 
        while !current.nil?
            result_str+="(#{current.value}) -> "
            current = current.next 
        end 
        
        result_str+= 'nil'
        p result_str

    end
    
    def insert_at(index, value)
        if (index < 0)
            return p "invalid index, can't be less than zero"
        end
        if index > self.size 
            return p "invalid index, must be within list size"
        end 
        count = 0 
        current = @head

        while count < index - 1 
            current = current.next 
            count += 1
        end 
        new_node = Node.new(value)
        next_node = current.next 
        current.next = new_node
        new_node.next = next_node
        self.to_s
    end

    def remove_at(index)
        if (index < 0)
            return p "invalid index, can't be less than zero"
        end
        if index > self.size 
            return p "invalid index, must be within list size"
        end 
        count = 0 
        current = @head
        previous_node = nil 

        while count < index 
            previous_node = current
            current = current.next 
            count += 1
        end 

        previous_node.next = current.next 
        current.next = nil
        self.to_s
    end 
end 





list = LinkedList.new
list.append(5)
list.append(6)
list.prepend(3)
p list.size
p list.at(1) 
list.to_s
p list.contains?(5)
p list.find(8)
list.insert_at(1, 8)
list.remove_at(3)
p "before popping"
list.pop
list.pop