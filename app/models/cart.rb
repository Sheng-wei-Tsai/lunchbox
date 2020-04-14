class Cart 

  def initialize
    @items = []
  end 

  def add_item(item_id)
    # 檢查 陣列裡面有沒有我們要的 cart_item
    found_item = @items.find {|item| item.item_id == item_id }
    #                            cart_item(上的id)  
    # found.class => CartItem 你是誰生出來的
    if found_item
      # 增加數量
      found_item.increment! 
    else
      # 找不到 創造一個給他
      @items << CartItem.new(item_id)
    end

  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end
  
  def total
    # 0 是初始值, reduce 累加歸納用
    @items.reduce(0) { |sum, item| sum + item.total }
    # @item.sum {|item| item.total }
    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end
    # return tmp


  end

end