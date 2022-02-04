# Ping the specified server (or the default 8.8.8.8) and say "ping"
# through the speaker every time a ping is successful. Based on an
# idea from @gnarf.
function pingtest() {
  local c
  for c in say spd-say; do [[ "$(which $c)" ]] && break; done
  ping ${1:-8.8.8.8} | perl -pe '/bytes from/ && `'$c' ping`'
}
