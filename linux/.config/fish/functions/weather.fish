function weather -a location
    command curl -H 'Accept-Language: es' http://wttr.in/$location
end
