local setup, copilot = pcall(require, "copilot")
if not setup then
  -- print("‼ Tried loading copilot ... unsuccessfully.")
  return
end

copilot.setup({
})
