class LinkedList 
    attr_accessor: :head, :tail 
    def initialize
        @head = nil 
        @tail = nil 
    end 
    def append(value)
        if(head.nil?)
            @head = Node.new(value)
        else
            last = nil 
            while(@head)
                last = head.next 
            end 
            last.next = Node.new(value)
        end 
    end
    
    def prepend(value)
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
    end
    
    def size 
        count = 0
        current = head 
        while(!current.nil?)
            count += 1
        end 
        count 
    end 

    def at(index)
        count = 0
        current = @head 
        while(count < index)
            current = current.next 
            index += 1
        end
        current 
    end 

    def pop
        current = @head  
        previous = nil 
        while !current.next.nil?
            current = current.next 
            previous = current
        end 
        previous.next = current.next 
        current.next = nil 
    end 

    def contains?(value)
        current = @head 
        while (current)
            if current.value == value 
                return true 
            end
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
        return nil   
    end 
end 


class Node 
    attr_accessor: :value, :next_node 
    def initialize
        @value = nil
        @next_node = nil 
    end 
end 