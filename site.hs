{-# LANGUAGE OverloadedStrings #-}
import Hakyll
import Control.Arrow

main :: IO ()
main = hakyll $ do
    -- Compile templates
    match "templates/*" $ compile templateCompiler

    -- CSS
    match "css/style.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "index.markdown" $ do
        route   $ setExtension "html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

