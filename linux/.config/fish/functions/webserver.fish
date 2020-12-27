function webserver -a port
    if test -n $port
        eval command python -m http.server $port
    else
        command python -m http.server 8000
    end
end
