#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all
  --enable-gpl            # required by x264
  #--enable-libx264        # enable x264
  --enable-zlib           # enable zlib
  --enable-avcodec
  --enable-avformat
  --enable-avfilter
  --enable-swresample
  --enable-swscale
  --enable-decoder=png
  --enable-encoder=png,gif
  --enable-parser=png,gif
  --enable-protocol=file
  --enable-demuxer=image2
  --enable-muxer=gif
  --enable-filter=scale,format,fps,split,palettegen,paletteuse,null

)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
