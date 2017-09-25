#Implementing a binary tree data structure
class Node
  attr_acessor :value
  def initialize(value, l_child, r_child)
    @value = value
    @l_child = l_child
    @r_child = r_child      
  end
  
  def parent
    @parent
  end
  
  def l_child
    @l_child
  end

  def r_child
    @r_child
  end
  
  def set_l_child(l_child)
    @l_child = l_child
  end
    
  def set_r_child(r_child)
    @r_child = r_child
  end
  
  def set_parent(parent)
    @parent = parent
  end
  
end
