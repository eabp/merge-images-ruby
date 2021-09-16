require 'mini_magick'
require 'carrierwave'
require 'RMagick'
include Magick


# MiniMagick::Tool::Convert.new do |img|
#     img.size '500x500'
#     img <<   'transparent'
  
#     img.fill "output.png"
  
#     img.draw "translate 2000, 2500 circle 0,0 2000,0"
#     img.trim
  
#     img << 'circle.png'
#   end

# MiniMagick::Tool::Convert.new do |img|
#     img.size '3900x5000'
#     img <<   'xc:transparent'
#     img.fill "audi.jpg"
#     img.draw "translate 2000, 2500 circle 0,0 2000,0"
#     img.trim
#     img << 'circle.png'
#   end


# image = MiniMagick::Image.open("user1.png") 
# image.combine_options do |cmd|
#   cmd << "user1.png"
#   cmd.gravity "Center"
#   cmd.stack do
#     cmd.size "200x200"
#     cmd.xc "Black"
#     cmd.fill "White"
#     cmd.draw "circle 100 100 100 1"
#     cmd.alpha "Copy"
#     cmd.compose "CopyOpacity"
#     cmd.composite
#   end
#   cmd.trim
# end


# MiniMagick::Tool::Convert.new do |img|
#     img.fill "user1.png"
#     img.size '3900x5000'
#     img.colorize 100
#     img.draw "circle 0,0 2000,0"
#     img.trim
#     img << 'circle.png'
# end



mask = ::MiniMagick::Image.open "user1.png"
mask.format 'png'

mask.combine_options do |m|
    # m.alpha 'transparent'
    m.background 'none'
    m.fill 'white'
    m.draw 'roundrectangle 50,50,%s,%s,%s,%s' % [100, 100, 100, 100]
    m.compose "CopyOpacity"
end

mask.write("result.png")


# bg = MiniMagick::Image.new("bg.png")

# body = MiniMagick::Image.new("body-009.png")
# body.resize("500x500")

# result = bg.composite(body) do |c|
#     c.compose "Over"    # OverCompositeOp
#     c.geometry "+40+140" # copy second_image onto first_image from (20, 20)
# end

# result.write "bg_body.png"
