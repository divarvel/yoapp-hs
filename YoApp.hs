{-#LANGUAGE OverloadedStrings #-}

module YoAPP where

import qualified Data.ByteString as BS
import           Data.Monoid ((<>))
import           Network.HTTP.Client

newtype ApiToken = ApiToken { unApiToken :: BS.ByteString }

sendYo :: ApiToken -> IO ()
sendYo token = withManager defaultManagerSettings $ \manager -> do
    req <- request
    withResponse req manager (const $ return ())
  where
    request = do
        initReq <- parseUrl "http://api.justyo.co/yoall/"
        return $ initReq
            { method = "POST"
            , requestBody =  RequestBodyBS $ "api_token=" <> unApiToken token
            }
