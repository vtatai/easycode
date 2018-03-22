{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Decoder where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Text.Julius (RawJS (..))
import qualified Data.Text as T
import Easycode

getDecoderR :: Handler Html
getDecoderR = do
    defaultLayout $ do
        $(widgetFile "decoder")

postDecoderR :: Handler Html
postDecoderR = do
    postedText <- runInputPost $ ireq textField "content"
    defaultLayout $ do
        let text = Easycode.fromCode . unpack $ postedText
        $(widgetFile "decoded")
