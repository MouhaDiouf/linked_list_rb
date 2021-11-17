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
end 


class Node 
    attr_accessor: :value, :next_node 
    def initialize
        @value = nil
        @next_node = nil 
    end 
end 