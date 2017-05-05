function replaceVars(file,keywords,replacees,replacers)
	local edit_file = io.open(file, "r")
	local text = {}
	for line in edit_file:lines() do
		table.insert (text, line)
	end
	edit_file:close()
	
	for i = 1, #text do
		for j = 1, #keywords do
			if text[i]:match(keywords[j]) then
				text[i] = text[i]:gsub(replacees[j],replacers[j])
			end
		end
	end
	
	edit_file = io.open(file, "w")
	
	for i = 1, #text do
		edit_file:write(text[i] .. "\n")
	end
	edit_file:close()

end

local config_file = "./config.php"
local config_keywords = {"\"php\" 	=>","\"curl\"	=>","\"gzip\"	=>","\"id\"	=>","\"stat\"	=>"}
local config_replacees = {"\'\'","\'\'","\'\'","\'\'","\'\'"}
local config_replacers = {"'/usr/bin/php'","'/usr/bin/curl'","'/bin/gzip'","'/usr/bin/id'","'/usr/bin/stat'"}


local startup_file = "/etc/rc.local"
local startup_keywords = {"exit 0"}
local startup_replacees = {"exit 0"}
local startup_replacers = {"screen -S rtorrent -fa -d -m rtorrent \nexit 0"}


--replaceVars(config_file,config_keywords,config_replacees,config_replacers)
--replaceVars(startup_file,startup_keywords,startup_replacees,startup_replacers)