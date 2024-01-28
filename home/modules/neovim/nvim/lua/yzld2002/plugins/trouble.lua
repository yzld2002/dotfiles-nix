local trouble_config, trouble = pcall(require, "trouble")
if not trouble_config then
	return
end

trouble.setup()
