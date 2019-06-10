class RootController < ApplicationController
  def top
    unless LpImage.all.empty?
      @lp_image = LpImage.find(1)
    else
      @lp_image=nil
     end
  end
end
