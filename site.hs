{-# LANGUAGE OverloadedStrings #-}

import Hakyll
import Control.Arrow

main :: IO ()
main = hakyll $ do
    match "templates/*" $ compile templateCompiler

    match "css/style.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "index.markdown" $ do
        route   $ setExtension "html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    match "projects.markdown" $ do
        route   $ constRoute "projects/index.html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    match "cv.markdown" $ do
        route   $ constRoute "cv/index.html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    match "posts.markdown" $ do
        route   $ constRoute "posts/index.html"
        compile $ pageCompiler 
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

