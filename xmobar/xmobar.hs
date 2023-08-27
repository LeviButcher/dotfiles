  import Xmobar

  background = "#0a111c"
  foreground = "#bbc0c7"

  config :: Config
  config =
    defaultConfig
      { 
        font = "Fira Code 12",
        allDesktops = True,
        alpha = 200,
        bgColor = background,
        fgColor = foreground,
        position = TopH 30,
        commands =
          [ 
            Run XMonadLog,
            Run $ Memory ["t", "Mem: <usedratio>%"] 10,
            Run $ Cpu 
            [ "-L", "3",
              "-H", "50",
              "--high", "red",
              "--normal", "green"
            ] 10,
            Run $ Date "%a %_d %b %Y <fc=#f7656d>%H:%M:%S</fc>" "date" 10
          ],
        template = "%XMonadLog% { %date% } %cpu% %memory%",
        alignSep = "{}"
      }

  main :: IO ()
  main = xmobar config  
