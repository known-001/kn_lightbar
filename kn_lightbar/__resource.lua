
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
server_scripts {
    'config.lua',
    'server.lua',
    '@mysql-async/lib/MySQL.lua'
}
client_scripts {
    'config.lua',
    'client.lua'
}

files {
    'html/style.css',
    'html/script.js',
    'html/index.html'
}

ui_page {
    'html/index.html'
}


