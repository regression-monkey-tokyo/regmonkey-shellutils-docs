local function render_card(title, href, desc)
  return string.format(
    '<div class="rm-card"><a href="%s"><h4>%s</h4><p>%s</p></a></div>',
    href or "#", title or "", desc or ""
  )
end

-- Shortcode: {{< card title="..." href="..." desc="..." >}}
local function card(_, kwargs, _)
  local title = pandoc.utils.stringify(kwargs["title"] or "")
  local href  = pandoc.utils.stringify(kwargs["href"]  or "#")
  local desc  = pandoc.utils.stringify(kwargs["desc"]  or "")
  return pandoc.RawInline("html", render_card(title, href, desc))
end

-- Shortcode: {{< card-grid >}} / {{< card-grid-end >}}
local function card_grid(_, _, _)
  return pandoc.RawInline("html", '<div class="card-grid">')
end

local function card_grid_end(_, _, _)
  return pandoc.RawInline("html", "</div>")
end

-- Div filter: :::{.card-grid} with ```yml code block inside
-- Must run before syntax highlighting transforms CodeBlock
return {
  traverse = "topdown",
  ["card"]          = card,
  ["card-grid"]     = card_grid,
  ["card-grid-end"] = card_grid_end,
  Div = function(el)
    if not el.classes:includes("card-grid") then return nil end

    local yaml_text = ""
    for _, block in ipairs(el.content) do
      if block.t == "CodeBlock" then
        yaml_text = block.text
        break
      end
    end

    if yaml_text == "" then return nil end

    local ok, data = pcall(function()
      return pandoc.read("---\n" .. yaml_text .. "\n---", "markdown").meta
    end)

    if not ok or not data or not data.cards then return nil end

    local html = '<div class="card-grid">'
    local cards = data.cards
    ---@cast cards table
    for _, item in ipairs(cards) do
      ---@cast item table
      local title = item.title and pandoc.utils.stringify(item.title) or ""
      local href  = item.href  and pandoc.utils.stringify(item.href)  or "#"
      local desc  = item.desc  and pandoc.utils.stringify(item.desc)  or ""
      html = html .. render_card(title, href, desc)
    end
    html = html .. "</div>"
    return pandoc.RawBlock("html", html)
  end,
}
