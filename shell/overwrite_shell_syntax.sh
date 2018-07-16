#!/bin/sh

alias when=if
alias end=fi
alias so=then

when [ true ]; so
  echo ok
end

