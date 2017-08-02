#!/bin/bash

google-chrome \
  --headless \
  --disable-gpu \
  --remote-debugging-port=9222 \
  --remote-debugging-address=0.0.0.0 \
  about:blank &