#! /bin/sh

# scale according to dpi
DPI="$(xrdb -query 2>/dev/null| grep dpi | sed 's/^.*\t//;s/\..*$//')"
if [ -n "$DPI" ]; then
  if [ "$DPI" -le 96 ]; then
          SCALE=""
  elif [ "$DPI" -le 120 ]; then
          SCALE="-Dsun.java2d.uiScale=1.25"
  elif [ "$DPI" -le 144 ]; then
          SCALE="-Dsun.java2d.uiScale=1.5"
  elif [ "$DPI" -le 192 ]; then
          SCALE="-Dsun.java2d.uiScale=2"
  elif [ "$DPI" -le 240 ]; then
          SCALE="-Dsun.java2d.uiScale=2.5"
  elif [ "$DPI" -le 288 ]; then
          SCALE="-Dsun.java2d.uiScale=3"
  elif [ "$DPI" -le 384 ]; then
          SCALE="-Dsun.java2d.uiScale=4"
  fi
fi

exec java $SCALE -jar $SNAP/highlighterpdf.jar
