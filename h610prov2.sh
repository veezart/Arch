#! /bin/bash  
# Setup HUION H610 PRO V2, after bridged to wacom driver with Digimend Kernel module.  
# License: CC-0/Public-Domain license  
# author: deevad  


# $ xsetwacom list
# Tablet definition  
tabletstylus="TABLET Pen Tablet Pen stylus"  
tabletpad="TABLET Pen Tablet Pad pad"  
# xsetwacom list modifiers  "HUION Huion Tablet Pad pad"
 
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
xsetwacom set "$tabletstylus" MapToOutput "HEAD-0"  
# setup ratio :  
# newtabletY=$(( $screenY * $tabletX / $screenX ))  
#xsetwacom --set "$tabletstylus" Area 0 0 "$tabletX" "$newtabletY"  


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

xsetwacom --set "$tabletpad" Button 1 key Ctrl Alt Z  # undo 
xsetwacom --set "$tabletpad" Button 2 key e           # erase  
xsetwacom --set "$tabletpad" Button 3 key b           # brush
xsetwacom --set "$tabletpad" Button 8 key Ctrl =      # zoom in  
xsetwacom --set "$tabletpad" Button 9 key Ctrl -      # zoom out 
xsetwacom --set "$tabletpad" Button 10 key ]          # increase size brush 
xsetwacom --set "$tabletpad" Button 11 key [          # decrease size brush
xsetwacom --set "$tabletpad" Button 12 key space      # grab  


# Xinput option  
# =============  
# for the list:  
# xinput list  

# xinput list-props 'TABLET Pen Tablet Mouse'  
# xinput set-prop 'TABLET Pen Tablet Mouse' "Evdev Middle Button Emulation" 0  
# alternate way to map to a single screen  
# execute "xrander" in a terminal to get the screen name ( DVI-D-0 in this example )  
# xinput set-prop 'TABLET Pen Tablet Pen stylus' DVI-D-0

    
        
          
            
