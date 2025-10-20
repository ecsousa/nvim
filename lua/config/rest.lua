
require("rest-nvim").setup({
  result = {
    formatters = {
      json = function(body, headers)
        -- Check Content-Type
        local content_type = headers["content-type"] or headers["Content-Type"]
        if content_type and content_type:match("application/json") then
          local ok, result = pcall(vim.fn.system, { "jq", "." }, body)
          if ok and vim.v.shell_error == 0 then
            return result
          end
        end
        return body
      end,
    },
  },
})
