-- jtobin.ca compiler

{-# LANGUAGE OverloadedStrings #-}

import Hakyll
import Control.Arrow

main :: IO ()
main = hakyll $ do
    match "templates/*" $ compile templateCompiler

    match "css/style.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "css/tight.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "cv.markdown" $ do
        route   $ constRoute "index.html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/cv.html"
            >>> relativizeUrlsCompiler

    match "posts.markdown" $ do
        route   $ constRoute "posts/index.html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

