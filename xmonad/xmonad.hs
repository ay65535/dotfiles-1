module Main (main) where

import           Control.Monad
import qualified Data.Map                         as M
import           System.Exit
import           System.IO
import           XMonad
import           XMonad.Actions.WindowNavigation
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Layout.Gaps
import           XMonad.Layout.IndependentScreens
import           XMonad.Layout.Spacing
import           XMonad.Layout.ThreeColumns
import           XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet                  as W
import           XMonad.Util.Run

-- xmonad.hs
-- author: Seong Yong-ju <sei40kr@gmail.com>

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal :: String
myTerminal = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
-- Width of the window border in pixels.
--
myBorderWidth   :: Dimension
myBorderWidth   = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       :: KeyMask
myModMask       = mod4Mask

-- NOTE: from 0.9.1 on numlock mask is set automatically. The numlockMask
-- setting should be removed from configs.
--
-- You can safely remove this even on earlier xmonad versions unless you
-- need to set it to something other than the default mod2Mask, (e.g. OSX).
--
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask -- deprecated in xmonad-0.9.1
------------------------------------------------------------


-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    :: [String]
myWorkspaces    = map show [1..9]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor :: String
myNormalBorderColor = "#ffffff"
myFocusedBorderColor :: String
myFocusedBorderColor = "#0088cc"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig {XMonad.modMask = modm} =
  M.fromList $
    -- launch a terminal
  [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
  , ((modm, xK_p), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    -- launch gmrun
  , ((modm .|. shiftMask, xK_p), spawn "gmrun")
    -- close focused window
  , ((modm .|. shiftMask, xK_c), kill)
     -- Rotate through the available layout algorithms
  , ((modm, xK_space), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
  , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
  , ((modm, xK_n), refresh)
    -- Move focus to the next window
  , ((modm, xK_Tab), windows W.focusDown)
    -- Move focus to the window on the left
  , ((modm, xK_h), sendMessage $ Go L)
    -- Move focus to the window below
  , ((modm, xK_j), windows W.focusDown)
    -- Move focus to the window above
  , ((modm, xK_k), windows W.focusUp)
    -- Move focus to the window on the right
  , ((modm, xK_l), sendMessage $ Go R)
    -- Move focus to the master window
  , ((modm, xK_m), windows W.focusMaster)
    -- Swap the focused window and the master window
  , ((modm, xK_Return), spawn $ XMonad.terminal conf)
    -- Swap the focused window with the window on the left
  , ((modm .|. shiftMask, xK_h), sendMessage $ Swap L)
    -- Swap the focused window with the window below
  , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    -- Swap the focused window with the window above
  , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    -- Swap the focused window with the window on the right
  , ((modm .|. shiftMask, xK_l), sendMessage $ Swap R)
    -- Shrink the master area
    -- , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    -- , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
  , ((modm, xK_t), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
  , ((modm, xK_comma), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
  , ((modm, xK_period), sendMessage (IncMasterN (-1)))
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    -- Quit xmonad
  , ((modm .|. shiftMask, xK_q), io exitSuccess)
    -- Restart xmonad
  , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    -- print, Capture a screenshot
  , ((0, xK_Print), spawn "scrot '%Y-%m-%d-%T-screenshot.png'")
    -- shift-print, Capture a screenshot selecting a window or rectangle with the mouse
  , ((shiftMask, xK_Print), spawn "scrot -s '%Y-%m-%d-%T-screenshot.png'")
  ] ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
  [ ((m .|. modm, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ] ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
  [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
  ]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings :: XConfig l -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings XConfig {XMonad.modMask = modm} = M.fromList

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsolete
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, and
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts $
  smartSpacing 8 $
  gaps
    [(U, 8), (D, 8), (R, 12), (L, 12)]
    (windowNavigation tiled) |||
  Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = ThreeColMid nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "feh" --> doCenterFloat
    , className =? "Gimp" --> doFloat
    , resource =? "desktop_window" --> doIgnore
    , resource =? "kdesktop" --> doIgnore
    ]
------------------------------------------------------------------------
-- Event handling

-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
-- myEventHook :: Event -> X Data.Monoid.All
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
myLogHook :: [Handle] -> X ()
myLogHook hs =
  dynamicLogWithPP
    xmobarPP
      { ppCurrent = xmobarColor heartColor "" . const heart
      , ppVisible = xmobarColor emptyHeartColor "" . const heart
      , ppHidden = xmobarColor emptyHeartColor "" . const heart
      , ppHiddenNoWindows = xmobarColor emptyHeartColor "" . const heart
      , ppUrgent = xmobarColor emptyHeartColor "" . const heart
      , ppWsSep = " "
      , ppSep = "    "
      , ppTitle = xmobarColor "#ffffff" ""
      , ppOrder = \(ws:_:t:_) -> [ws, t]
      , ppOutput = forM_ hs . flip hPutStrLn
      }
  where
    heart = "<fn=1>\xF7D0</fn>"
    heartColor = "#fd353f"
    emptyHeartColor = "#393c33"


------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole. It will
-- add initialization of EWMH support to your custom startup hook by combining
-- it with ewmhDesktopsStartup.
--
myStartupHook = return ()

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
  screens <- countScreens :: IO Integer
  hs <- mapM (spawnPipe . ("xmobar -x" ++) . show . (1 -)) [1 .. screens]
  xmonad $ defaults hs

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults hs =
  ewmh $
  docks $
  def
      -- simple stuff
    { terminal = myTerminal
    , focusFollowsMouse = myFocusFollowsMouse
    , borderWidth = myBorderWidth
    , modMask = myModMask
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
    , workspaces = myWorkspaces
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
      -- key bindings
    , keys = myKeys
    , mouseBindings = myMouseBindings
      -- hooks, layouts
    , layoutHook = myLayout
    , manageHook = myManageHook
    , handleEventHook = myEventHook
    , logHook = myLogHook hs
    , startupHook = myStartupHook
    }