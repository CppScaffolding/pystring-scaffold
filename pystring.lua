-- scaffold geniefile for pystring

pystring_script = path.getabsolute(path.getdirectory(_SCRIPT))
pystring_root = path.join(pystring_script, "pystring")

pystring_includedirs = {
	path.join(pystring_script, "config"),
	pystring_root,
}

pystring_libdirs = {}
pystring_links = {}
pystring_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { pystring_includedirs }
	end,

	_add_defines = function()
		defines { pystring_defines }
	end,

	_add_libdirs = function()
		libdirs { pystring_libdirs }
	end,

	_add_external_links = function()
		links { pystring_links }
	end,

	_add_self_links = function()
		links { "pystring" }
	end,

	_create_projects = function()

project "pystring"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		pystring_includedirs,
	}

	defines {}

	files {
		path.join(pystring_script, "config", "**.h"),
		path.join(pystring_root, "**.h"),
		path.join(pystring_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
