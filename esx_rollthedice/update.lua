PerformHttpRequest('https://github.com/DGJay/esx_rollthedice/blob/main/version.txt', function(err, serverVersion, headers)
    local version = '1.0'
    if string.find(serverVersion, version) == nil then
        Wait(120)
        print('\n')
        print('||||||||||||||||||||||||||||||||||')
        print('||||| ADDON: esx_rollthedice |||||')
        print('|||||||||||| OUTDATED ||||||||||||')
        print('||||||||||||||||||||||||||||||||||')
        print('\n')
    else
        Wait(120)
        print('\n')
        print('||||||||||||||||||||||||||||||||||')
        print('||||| ADDON: esx_rollthedice |||||')
        print('|||||||||||| UPDATED! ||||||||||||')
        print('||||||||||||||||||||||||||||||||||')
        print('\n')
    end
end)