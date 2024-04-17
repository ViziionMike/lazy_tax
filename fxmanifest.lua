fx_version 'cerulean'
games { 'gta5' }

author 'Mike'
description 'LAZY Tax'
version '1.0.0'

dependency 'es_extended'

-- Server Scripts
server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'server.lua',
}

-- Client Scripts
client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client.lua',
}

files {
    'config.lua'
}

lua54 'yes'
