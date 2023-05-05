# I know that this probably isn't so efficient
# cause I'm running benchmark for v18 twice

# fs
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "bench-opendir.js" \
  --filter "bench-readdir.js" \
  --filter "bench-realpath.js" \
  --filter "bench-stat-promise.js" \
  --filter "readfile.js" \
  --filter "writefile-promises.js" \
  fs  > compare-fs-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "bench-opendir.js" \
  --filter "bench-readdir.js" \
  --filter "bench-realpath.js" \
  --filter "bench-stat-promise.js" \
  --filter "readfile.js" \
  --filter "writefile-promises.js" \
  fs  > compare-fs-18-20.csv

# events
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "ee-add-remove.js" \
  --filter "ee-emit.js" \
  --filter "ee-listener-unique.js" \
  --filter "ee-once.js" \
  --filter "eventtarget-add-remove.js" \
  --filter "eventtarget.js" \
  events  > compare-events-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "ee-add-remove.js" \
  --filter "ee-emit.js" \
  --filter "ee-listener-unique.js" \
  --filter "ee-once.js" \
  --filter "eventtarget-add-remove.js" \
  --filter "eventtarget.js" \
  events  > compare-events-18-20.csv

# http
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "bench-parser.js" \
  --filter "simple.js" \
  http  > compare-http-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "bench-parser.js" \
  --filter "simple.js" \
  http  > compare-http-18-20.csv

# misc
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "trace.js" \
  --filter "startup.js" \
  misc  > compare-misc-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "trace.js" \
  --filter "startup.js" \
  misc  > compare-misc-18-20.csv

# module
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "module-require.js" \
  module  > compare-module-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "module-require.js" \
  module  > compare-module-18-20.csv

# streams
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "creation.js" \
  --filter "destroy.js" \
  --filter "pipe.js" \
  --filter "readable-async-iterator.js" \
  --filter "readable-from.js" \
  streams  > compare-streams-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "creation.js" \
  --filter "destroy.js" \
  --filter "pipe.js" \
  --filter "readable-async-iterator.js" \
  --filter "readable-from.js" \
  streams  > compare-streams-18-20.csv

# url
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "url-parse.js" \
  --filter "url-resolve.js" \
  url  > compare-url-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "url-parse.js" \
  --filter "url-resolve.js" \
  url  > compare-url-18-20.csv

# buffers
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "buffer-base64-encode.js" \
  --filter "buffer-base64-decode.js" \
  --filter "buffer-compare.js" \
  --filter "buffer-concat.js" \
  --filter "buffer-from.js" \
  --filter "buffer-tojson.js" \
  --filter "buffer-tostring.js" \
  buffers  > compare-buffers-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "buffer-base64-encode.js" \
  --filter "buffer-base64-decode.js" \
  --filter "buffer-compare.js" \
  --filter "buffer-concat.js" \
  --filter "buffer-from.js" \
  --filter "buffer-tojson.js" \
  --filter "buffer-tostring.js" \
  buffers  > compare-buffers-18-20.csv

# util
node benchmark/compare.js \
  --old ./node16 \
  --new ./node18 \
  --filter "text-" \
  util  > compare-util-16-18.csv

node benchmark/compare.js \
  --old ./node18 \
  --new ./node20 \
  --filter "text-" \
  util  > compare-util-18-20.csv
