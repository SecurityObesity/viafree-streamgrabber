#!/bin/bash
# Minimum Requirement: sudo apt install python-pip curl; pip install json jsonpath
read -r -p "Enter a valid number identifier: " inNumber
URLString="https://playapi.mtgx.tv/v3/videos/stream-links/$inNumber?device=web"
getStreamingURL=$(curl -s $URLString | python -c "import sys,json,jsonpath; print '\n'.join(jsonpath.jsonpath(json.load(sys.stdin), 'embedded.prioritizedStreams.0.links.stream.href'))")
echo -e "\nStreaming URL:\n$getStreamingURL\n"
echo -e "There must be entered a valid number, then it should be a url for streaming video in a external media player."
echo -e "if you experience a issue. Please try again later."