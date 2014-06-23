# Yo Haskell API

```haskell
{-#LANGUAGE OverloadedStrings#-}

module Main where

import YoApp (sendYo, ApiToken)

main = sendYo (ApiToken "your token")

```

et voilà
