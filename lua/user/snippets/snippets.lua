local ls = require("luasnip")

return {
	ls.add_snippets(
	"all", {
		s("curtime",f(function()
			return os.date "%D-%H-%M"
		end
		))
	}
	)
}
