{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Echo where

import Import

getEchoR :: Text -> Handler RepHtml
getEchoR theText = do
    defaultLayout $ do
        $(widgetFile "echo")
