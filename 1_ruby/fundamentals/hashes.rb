h = {:first => "Gikuyu", :last => "Nderitu"}
i = h.delete(:last)
puts h.has_key?(:'first')
puts h.has_value?('ikuyu')
puts i
