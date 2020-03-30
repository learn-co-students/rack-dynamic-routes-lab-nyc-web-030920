class Application 

    @@items = [Item.new('Switch', 300)]

    def call(env)
        resp = Rack::Response.new 
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split('/items/').last 
            if found_item = @@items.find {|item_instance| item_instance.name == item} 
                resp.write "#{found_item.price}"
            else 
                resp.write "Item not found"
                resp.status = 400
            end
        else  
            resp.status = 404 
            resp.write "Route not found"
        end
        resp.finish 
    end
end


            
