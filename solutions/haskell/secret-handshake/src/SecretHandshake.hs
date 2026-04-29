module SecretHandshake (handshake) where

import Data.Bits as Bits

handshake :: Int -> [String]
handshake n =
    if n .&. 16 == 16 then (reverse moves) else moves
    where
        moves = filter (not . null) [
                    if n .&. 1 == 1 then "wink"            else [],
                    if n .&. 2 == 2 then "double blink"    else [],
                    if n .&. 4 == 4 then "close your eyes" else [],
                    if n .&. 8 == 8 then "jump"            else []
                ]