{-# LANGUAGE OverloadedStrings #-}

module Dragons.Main where

import AI (ais)
import Data.IORef (IORef)
import Data.Proxy (Proxy)
import Data.Streaming.Network (bindPortTCP, getSocketTCP)
import Dragons.SushiGo (toAITable, rules1100)
import Dragons.SushiGo.Text (textUI)
import Dragons.Game (GameConfig(..), MoveSource(..), player, runGame)
import Dragons.Game.UI.Json (jsonUI)
import Dragons.Options
import Network.Socket (accept, close)
import Dragons.Game.Network

appMain :: IO ()
appMain = do
  options <- parseOptions (toAITable ais)

  let
    -- Only print when running in interactive mode
    putStrLnInteractive s = case optUI options of
      Json -> pure ()
      _ -> putStrLn s

    socket :: IO (Maybe (IORef GameSocket))
    socket =
      case optNetworkMode options of
        Nothing -> pure Nothing
        Just (Host port) -> do
          server <- bindPortTCP port "*"
          putStrLnInteractive "Waiting for other player to connect..."
          (s, _) <- accept server
          close server
          s' <- mkGameSocket s
          pure $ Just s'
        Just (Connect host port) -> do
          putStrLnInteractive "Connecting to remote game..."
          (s, _) <- getSocketTCP host port
          s' <- mkGameSocket s
          pure $ Just s'

    addSocketToSource
      :: MoveSource st mv Proxy
      -> IO (MoveSource st mv IORef)
    addSocketToSource source = case source of
      Human -> pure Human
      AI name f -> pure $ AI name f
      Network _ -> case optNetworkMode options of
        Nothing -> error "appMain: Network move source but no network config."
        Just (Host _) -> do
          sckt <- socket
          case sckt of
            Nothing -> error "no socket found for host"
            (Just s) -> Network <$> pure s  
        Just (Connect _ _) -> do
          sckt <- socket
          case sckt of
            Nothing -> error "no socket found for client"
            (Just s) -> Network <$> pure s

  

  -- Set up the network sockets, if we need to.
  p1Source <- addSocketToSource $ optPlayer1 options
  p2Source <- addSocketToSource $ optPlayer2 options

  let
    config = GameConfig
      { configMoveSource = player p1Source p2Source
      , configAITimeout = optTimeout options
      , configDebugFlags = optDebugFlags options
      }

    -- rules = rules1100 (optSeed options)

  -- Launch the UI that the command-line asked for.
  case optUI options of
    Text -> do 
      rules <- rules1100 (optSeed options)
      runGame rules $ textUI config 
      -- runGame rules $ textUI config
    Json -> do 
      rules <- rules1100 (optSeed options)
      runGame rules =<< jsonUI config