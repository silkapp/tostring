{-# LANGUAGE
    FlexibleInstances
  , TypeSynonymInstances
  , DefaultSignatures
  #-}
module Data.String.ToString (ToString (..)) where

import Data.Int
import Data.Word
import Data.CaseInsensitive (CI, foldedCase)
import qualified Data.ByteString.Lazy.UTF8 as LBU
import qualified Data.ByteString.UTF8      as SBU
import qualified Data.Text                 as ST
import qualified Data.Text.Lazy            as LT

class ToString a where
  toString :: a -> String
  default toString :: Show a => a -> String
  toString = show

instance ToString Bool
instance ToString Float
instance ToString Double
instance ToString Int
instance ToString Int8
instance ToString Int16
instance ToString Int32
instance ToString Int64
instance ToString Integer
instance ToString Word
instance ToString Word8
instance ToString Word16
instance ToString Word32
instance ToString Word64

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
