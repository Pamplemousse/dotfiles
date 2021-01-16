{-
  ```
  xmonad --recompile
  # press M-q to reload
  ```
-}

import Graphics.X11.ExtraTypes
import XMonad
import XMonad.Actions.GroupNavigation
import XMonad.Config.Bepo
import XMonad.Config.Xfce
import XMonad.Util.EZConfig

import qualified Data.Map as M


myKeys = [ ("M-<Tab>", nextMatch Forward (return True))
         , ("M-S-<Tab>", nextMatch Backward (return True))
         , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%")
         , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%")
         , ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle")
         , ("<XF86AudioPlay>", spawn "playerctl --player=vlc,firefox,%any play-pause")
         ]

main = xmonad $ xfceConfig
    { modMask = mod4Mask
    , keys = \c -> bepoKeys c `M.union` keys xfceConfig c
    }
    `additionalKeysP` myKeys
