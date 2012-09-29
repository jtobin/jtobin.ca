#!/bin/bash
ghc -O2 site.hs && rm *hi *o && strip site

