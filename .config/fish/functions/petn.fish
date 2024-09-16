# register previous command in pet
function petn
  set line (echo $history[2])
  pet new $line
end
