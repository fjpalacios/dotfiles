function init
    command npx license $argv[1] > LICENSE; npx gitignore $argv[2]; npx covgen $argv[3]
end
