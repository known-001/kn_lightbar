server_script {
    'config.lua',
    'server.lua'
}

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
client_scripts {
    'config.lua',
    'client.lua'
}

files {
    'html/style.css',
    'html/script.js',
    'html/index.html',
    'data/vehicles.meta',
	'data/carcols.meta',
	'data/carvariations.meta'
}

ui_page {
    'html/index.html'
}

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'


