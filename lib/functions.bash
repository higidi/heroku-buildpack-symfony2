function indent() {
  rp=${1:-6}
  for (( c=1; c<=$rp; c++ ))
  do
    s="$s "
  done
  c="s/^/$s/"
  case $(uname) in
    Darwin) sed -l "$c";;
    *)      sed -u "$c";;
  esac
}

function strip_slashes() {
  echo $(echo "$1" | sed -e "s/\//\\\\\//g")
}

mktmpdir() {
  dir=$(mktemp -t $1-XXXX)
  rm -rf $dir
  mkdir -p $dir
  echo $dir
}