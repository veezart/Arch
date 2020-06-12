#! /bin/bash  
# Setup HUION H610 PRO V2, after bridged to wacom driver with Digimend Kernel module.


# $ xsetwacom list
# Tablet definition  
tabletstylus="HUION Huion Tablet Pen stylus"  
tabletpad="HUION Huion Tablet Pad pad"  

 
# Mapping
# $ xrandr
# get maximum size geometry with:  
# xsetwacom --get "$tabletstylus" Area  
# 0 0 55200 34500  
# tabletX=55200  
# tabletY=34500  
# screen size:  
# screenX=1920  
# screenY=1080  
# map to good screen (dual nvidia)  
xsetwacom set "$tabletstylus" MapToOutput "HDMI-0"


# Buttons 

# 
#   ------
#   |  1 |
#   |----|
#   |  2 |
#   |----|
#   |  3 |
# |========|
# |    8   |
# |========|
# |    9   |
# |========|
#   | 10 |
#   |----|
#   | 11 |
#   |----|
#   | 12 |
#   ------   

# xsetwacom list modifiers  "HUION Huion Tablet Pad pad"
xsetwacom --set "$tabletpad" Button 1 key Ctrl Alt Z  # undo 
xsetwacom --set "$tabletpad" Button 2 key e           # erase  
xsetwacom --set "$tabletpad" Button 3 key b           # brush
xsetwacom --set "$tabletpad" Button 8 key Ctrl =      # zoom in  
xsetwacom --set "$tabletpad" Button 9 key Ctrl -      # zoom out 
xsetwacom --set "$tabletpad" Button 10 key ]          # increase size brush 
xsetwacom --set "$tabletpad" Button 11 key [          # decrease size brush
xsetwacom --set "$tabletpad" Button 12 key space      # grab

# xsetwacom --set "$tabletstylus" Button 2 key empty      # empty
# xsetwacom --set "$tabletstylus" Button 3 key empty      # empty


    
        
          
            
