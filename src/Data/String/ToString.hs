{-# LANGUAGE
    FlexibleInstances
  , TypeSynonymInstances
  , DefaultSignatures
  #-}
module Data.String.ToString (ToString (..)) where

import Data.CaseInsensitive (CI, foldedCase)
import qualified Data.ByteString.Lazy.UTF8 as LBU
import qualified Data.ByteString.UTF8      as SBU
import qualified Data.Text                 as ST
import qualified Data.Text.Lazy            as LT

class ToString a where
  toString :: a -> String
  default toString :: Show a => a -> String
  toString = show

instance ToString String where
  toString = id

instance ToString SBU.ByteString where
  toString = SBU.toString

instance ToString LBU.ByteString where
  toString = LBU.toString

instance ToString ST.Text where
  toString = ST.unpack

instance ToString LT.Text where
  toString = LT.unpack

instance ToString s => ToString (CI s) where
  toString = toString . foldedCase
